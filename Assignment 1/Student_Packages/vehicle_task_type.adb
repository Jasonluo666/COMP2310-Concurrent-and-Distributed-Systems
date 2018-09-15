-- Suggestions for packages which might be useful:

with Ada.Real_Time;              use Ada.Real_Time;
with Ada.Text_IO;                use Ada.Text_IO;
with Exceptions;                 use Exceptions;
--  with Generic_Sliding_Statistics;
--  with Rotations;                  use Rotations;
with Vectors_3D;                 use Vectors_3D;
with Vehicle_Interface;          use Vehicle_Interface;
with Swarm_Structures;           use Swarm_Structures;
with Swarm_Structures_Base;      use Swarm_Structures_Base;
with Real_Type;                  use Real_Type;
with Vehicle_Message_Type;       use Vehicle_Message_Type;
with vehicleFunction;            use vehicleFunction;

package body Vehicle_Task_Type is

   task body Vehicle_Task is

      Vehicle_No : Positive; pragma Unreferenced (Vehicle_No);
      -- You will want to take the pragma out, once you use the "Vehicle_No"
      Message        : Inter_Vehicle_Messages;
      is_updated     : Boolean := False;
      latest_message : Inter_Vehicle_Messages;
      -- threshold
      dangerous_charge_level : constant Vehicle_Charges := 0.5;
      message_outdated       : constant Duration := 0.5;
      is_message_initialized : Boolean := False;
      -- Throttle for going back to globes and finding updated messages
      find_message_speed     : constant Throttle_T := 0.5;
      -- Throttle for going to get recharged
      find_globe_speed       : constant Throttle_T := 1.0;
      -- Throttle for getting back
      bounce_speed           : constant Throttle_T := 0.5;
      Idle_speed             : constant Throttle_T := 0.0;
      -- distance constraint
      globe_distance_limit   : constant Real := 0.1;
   begin
      -- default latest_message
      vehicleFunction.message_initialize (latest_message);

      -- You need to react to this call and provide your task_id.
      -- You can e.g. employ the assigned vehicle number (Vehicle_No)
      -- in communications with other vehicles.

      accept Identify (Set_Vehicle_No : Positive; Local_Task_Id : out Task_Id) do
         Vehicle_No     := Set_Vehicle_No;
         Local_Task_Id  := Current_Task;
      end Identify;
      -- Replace the rest of this task with your own code.
      -- Maybe synchronizing on an external event clock like "Wait_For_Next_Physics_Update",
      -- yet you can synchronize on e.g. the real-time clock as well.

      -- Without control this vehicle will go for its natural swarming instinct.

      select

         Flight_Termination.Stop;

      then abort

         Outer_task_loop : loop

            Wait_For_Next_Physics_Update;

            -- Your vehicle should respond to the world here: sense, listen, talk, act?

            declare
               globes : constant Energy_Globes := Energy_Globes_Around;
            begin
               -- find globe
               if globes'Length /= 0 then
                  -- shared memory
                  -- vehicleFunction.set_shared_position (globes (1).Position);
                  -- vehicleFunction.set_shared_velocity (globes (1).Velocity);

                  -- update the message
                  is_message_initialized := True;
                  for index in globes'Range loop
                     Message.globe_discovered (index) := globes (index);
                  end loop;
                  Message.globe_number := globes'Length;
                  -- update time
                  Message.update_time := Ada.Real_Time.Clock;
                  -- message type => find new globe
                  vehicleFunction.set_find_globe (Message);
                  Send (Message);

                  latest_message := Message;
                  -- if there is plentiful Charge left, set free to avoid collision (get stuck and waste others time)
                  if Current_Charge > dangerous_charge_level then
                     Set_Throttle (Idle_speed);
                  end if;
               end if;
            end;
            -- initialize the message
            if is_message_initialized = False then
               if Messages_Waiting then
                  Receive (Message);
                  is_message_initialized := True;
                  latest_message := Message;
               end if;
            -- analyze the message
            else
               declare
                  -- count the time during between now and the latest message received
                  update_duration : constant Duration := To_Duration (Ada.Real_Time.Clock - latest_message.update_time);
                  -- calculate which is the closest globe
                  closest_globe_index : constant Integer := vehicleFunction.get_closest_globe (Position, latest_message.globe_discovered, latest_message.globe_number);
               begin
                  -- if get a message
                  if Messages_Waiting then
                     Receive (Message);

                     if Message.is_find_globe and then Message.update_time > latest_message.update_time then
                        latest_message := Message;

                        -- find somebody need help
                     elsif Message.is_ask_info and then latest_message.update_time > Message.update_time then
                        Message := latest_message;
                        vehicleFunction.set_answer_info (Message);
                        Send (Message);

                        Put_Line ("answer");
                        -- find some new message
                     elsif latest_message.is_ask_info and then Message.is_answer_info and then latest_message.update_time < Message.update_time then
                        latest_message := Message;
                        -- if message isn't new enough, keep listening, back to the original globe place
                        if update_duration > message_outdated then
                           vehicleFunction.set_ask_info (latest_message);
                           Set_Throttle (find_message_speed);
                           Set_Destination (latest_message.globe_discovered (closest_globe_index).Position);
                           -- new message, set free
                        else
                           Set_Throttle (Idle_speed);
                           is_updated := True;
                        end if;

                        Put_Line ("get answer");
                     end if;
                  end if;

                  -- cannot get message for a long time, back to the original globe place
                  if update_duration > message_outdated then
                     if is_updated then
                        Set_Throttle (find_message_speed);
                        Set_Destination (latest_message.globe_discovered (closest_globe_index).Position);
                     end if;

                     vehicleFunction.set_ask_info (latest_message);
                     Send (latest_message);

                     is_updated := False;
                     Put_Line ("ask");
                  end if;

                  -- forward the new message as many as possible
                  if update_duration < message_outdated then
                     vehicleFunction.set_find_globe (latest_message);
                     Send (latest_message);
                     is_updated := True;
                  end if;

                  -- need to get charged, have newest information, go there
                  if Current_Charge < dangerous_charge_level and then is_updated then
                     Set_Throttle (find_globe_speed);
                     Set_Destination (latest_message.globe_discovered (closest_globe_index).Position);
                  end if;

                  -- if vehicle get newest message, behaviors are below
                  if Current_Charge > dangerous_charge_level and then update_duration < message_outdated then
                     declare
                        globe_distance  : constant Real := vehicleFunction.get_distance (Position, latest_message.globe_discovered (closest_globe_index).Position);
                        distance_vector : constant Vector_3D := latest_message.globe_discovered (closest_globe_index).Position - Position;
                     begin
                        -- if vehicle goes to far, bounce back
                        if globe_distance > globe_distance_limit then
                           Set_Throttle (bounce_speed);
                           Set_Destination (Position + distance_vector);

                           Put_Line ("bounce");
                           -- not to far, set free
                        else
                           Set_Throttle (Idle_speed);
                        end if;
                     end;
                  end if;

               end;
            end if;

            if Current_Charge = 1.0 then
               Put_Line ("get charged");
            elsif Current_Charge < 0.2 then
               Put_Line ("energy: " & Current_Charge'Image);
            end if;

         end loop Outer_task_loop;

      end select;

      Put_Line ("Vehicle end");

   exception
      when E : others => Show_Exception (E);

   end Vehicle_Task;

end Vehicle_Task_Type;
