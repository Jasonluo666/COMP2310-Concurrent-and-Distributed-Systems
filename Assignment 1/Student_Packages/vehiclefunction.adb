with Ada.Real_Time;              use Ada.Real_Time;
with Ada.Text_IO;                use Ada.Text_IO;
with Vectors_3D;                 use Vectors_3D;
with Vehicle_Interface;          use Vehicle_Interface;

package body vehicleFunction is

   procedure showPosition (thisPosition : Positions) is
   begin
      Put_Line ("current Position: " & thisPosition (x)'Image & "." & thisPosition (y)'Image & "." & thisPosition (z)'Image);
   end showPosition;

   procedure showVelocity (thisVelocity : Velocities) is
   begin
      Put_Line ("current Velocity: " & thisVelocity (x)'Image & "." & thisVelocity (y)'Image & "." & thisVelocity (z)'Image);
   end showVelocity;

   procedure showAcceleration (thisAcceleration : Accelerations) is
   begin
      Put_Line ("current Acceleration: " & thisAcceleration (x)'Image & "." & thisAcceleration (y)'Image & "." & thisAcceleration (z)'Image);
   end showAcceleration;

   procedure showCharge (charge : Vehicle_Charges) is
      pragma Unreferenced (charge);
   begin
      Put_Line ("Current Charge: " & Current_Charge'Image);
   end showCharge;

   procedure set_shared_position (pos : Positions) is
   begin
      shared_position := pos;
   end set_shared_position;

   procedure set_shared_velocity (vel : Velocities) is
   begin
      shared_velocity := vel;
   end set_shared_velocity;

   function get_shared_position return Positions is (shared_position);

   function get_shared_velocity return Velocities is (shared_velocity);

   function get_distance (Pos1, Pos2 : Positions) return Real is
      x_distance : constant Real := Pos1 (x) - Pos2 (x);
      y_distance : constant Real := Pos1 (y) - Pos2 (y);
      z_distance : constant Real := Pos1 (z) - Pos2 (z);
      distance   : Real;
   begin
      distance := x_distance * x_distance + y_distance * y_distance + z_distance * z_distance;
      return distance;
   end get_distance;

   function get_closest_globe (Current_Position : Positions; Globes : Energy_Globes; Globes_number : Integer) return Integer is
      closest_globe_index : Integer := 1;
      closest_distance : Real := get_distance (Current_Position, Globes (1).Position);
      current_distance : Real;
   begin
      declare
         index : Integer := 1;
      begin
         loop
            current_distance := get_distance (Current_Position, Globes (index).Position);

            if current_distance < closest_distance then
               Put_Line ("changes " & current_distance'Image & " < " & closest_distance'Image);
               closest_globe_index := index;
               closest_distance := current_distance;
            end if;

            index := Integer'Succ (index);
            exit when index > Globes_number;
         end loop;
         -- Put_Line (closest_globe_index'Image);
      end;
      return closest_globe_index;
   end get_closest_globe;

   procedure set_ask_info (Msg : in out Inter_Vehicle_Messages) is
   begin
      Msg.is_find_globe := False;
      Msg.is_ask_info   := True;
      Msg.is_answer_info := False;
   end set_ask_info;

   procedure set_find_globe (Msg : in out Inter_Vehicle_Messages) is
   begin
      Msg.is_find_globe := True;
      Msg.is_ask_info   := False;
      Msg.is_answer_info := False;
   end set_find_globe;
   procedure set_answer_info (Msg : in out Inter_Vehicle_Messages) is
   begin
      Msg.is_find_globe := False;
      Msg.is_ask_info   := False;
      Msg.is_answer_info := True;
   end set_answer_info;

   procedure message_initialize (Msg : in out Inter_Vehicle_Messages) is
   begin
      Msg.is_find_globe := False;
      Msg.is_ask_info   := False;
      Msg.is_answer_info := False;
      Msg.globe_number := 0;
      Msg.update_time := Ada.Real_Time.Clock;
   end message_initialize;

end vehicleFunction;
