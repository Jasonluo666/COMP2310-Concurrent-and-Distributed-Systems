--
--  Framework: Uwe R. Zimmer, Australia, 2015
--

--  Assignment 2 :PASSING THE MESSAGE
--
--  Implementation : Jiangshan Luo, Australian National University, 2017
--
--  Description:
--       The router is designed to survive through different network topologies which
--       have been given if time permits. And the network should keep working even if there
--       are several routers (depends on topology and the number of routers) powered down.
--
--       However, it takes some time to make a preparation/adjustment if the topology is
--       complex or there are routers powered down.
--

with Exceptions;           use Exceptions;
-- with Ada.Text_IO;          use Ada.Text_IO;

package body Generic_Router is

   task body Router_Task is

      Connected_Routers : Ids_To_Links;

      Local_Routing_Table : Routing_Table;
      -- Queue -> save messages that need client to pick up
      Local_Mailbox_Queue : Protected_Mailbox_Queue;
      -- Queue -> save messages that are not able to be sent
      Local_Message_Hold_Queue : Protected_Message_Hold_Queue;

   begin
      accept Configure (Links : Ids_To_Links) do
         Connected_Routers := Links;
      end Configure;

      declare
         Port_List                  : constant Connected_Router_Ports := To_Router_Ports (Task_Id, Connected_Routers);
         -- Received the shutdown call
         Is_Shutdown                : Boolean := False;
         -- Have new routing table, waiting for broadcast
         Is_Updated                 : Boolean := False;
         -- Have message, need to be sent
         Message_Hold               : Messages_Forward;
         -- Get client message, need to be picked up
         Message_Wait_For_Pick_Up   : Messages_Mailbox;
         -- Message in the Receive Message Queue
         Receive_Message_Number     : Integer;
      begin
         --  Replace the following accept with the code of your router
         -- (and place this accept somewhere more apporpriate)

         -- Add Itself to Routing Table
         Local_Routing_Table (Task_Id).Next_Hop        := Task_Id;
         Local_Routing_Table (Task_Id).Distance        := 0;

         -- Add Neighbors to Routing Table
         for index in Port_List'Range loop
            declare
               Link_Router_ID : constant Router_Range := Port_List (index).Id;
            begin
               Local_Routing_Table (Link_Router_ID).Next_Hop := Link_Router_ID;
               Local_Routing_Table (Link_Router_ID).Distance := 1;
            end;
         end loop;

         declare
            -- Task -> To start the Distance Vector Algorithm, send the Original Routing Table
            task Initial_Vector_Sender;
            -- Task -> Send Updated Routing Table to Neighbors
            task Update_Vector_Sender is
               entry Send_Vector;
               entry Close_Sender;
            end Update_Vector_Sender;

            task body Initial_Vector_Sender is
               Initial_Message : Messages_Routing_Table;
            begin
               if Task_Id = Router_Range'First then
                  Initial_Message.Sender             := Task_Id;
                  Initial_Message.This_Routing_Table := Local_Routing_Table;
                  for element of Port_List loop
                     if Local_Routing_Table (element.Id).Is_Powered_Down = False then
                        element.Link.all.Distance_Vector_Message (Initial_Message);
                     end if;
                  end loop;
               end if;
            end Initial_Vector_Sender;

            task body Update_Vector_Sender is
               Update_Message  : Messages_Routing_Table;
               Is_Closed       : Boolean := False;
            begin
               loop
                  select
                     -- if get a call, send local routing table to neighbors
                     accept Send_Vector;
                     Update_Message.Sender             := Task_Id;
                     Update_Message.This_Routing_Table := Local_Routing_Table;

                     for element of Port_List loop
                        if Local_Routing_Table (element.Id).Is_Powered_Down = False then
                           select
                              element.Link.all.Distance_Vector_Message (Update_Message);
                           or
                              delay 0.1;
                           end select;
                        end if;
                     end loop;
                  or
                     -- find the router is shutdown, terminate
                     accept Close_Sender  do
                        Is_Closed := True;
                     end Close_Sender;
                  end select;

                  exit when Is_Closed;
               end loop;

            end Update_Vector_Sender;

         begin
            loop
               select
                  -- receive message from client
                  accept Send_Message    (Message :     Messages_Client) do

                     -- haven't found the path to the destination
                     if Local_Routing_Table (Message.Destination).Distance = Natural'Invalid_Value then
                        -- Put_Line ("Cannot find the path to the destination");
                        Message_Hold.Sender      := Task_Id;
                        Message_Hold.Destination := Message.Destination;
                        Message_Hold.The_Message := Message.The_Message;
                        Message_Hold.Hop_Counter := 0;
                        -- save the message into the Holding Queue
                        Local_Message_Hold_Queue.Enqueue (Message_Hold);

                     -- this is the destination, change the message format
                     elsif Task_Id = Message.Destination then

                        Message_Wait_For_Pick_Up.The_Message := Message.The_Message;
                        Message_Wait_For_Pick_Up.Sender      := Task_Id;
                        Message_Wait_For_Pick_Up.Hop_Counter := 0;
                        -- save the message into the Picking Up Queue
                        Local_Mailbox_Queue.Enqueue (Message_Wait_For_Pick_Up);

                     -- haven't reached the destination, normally forwarding the message
                     else
                        declare
                           Pass_Message : Messages_Forward;
                        begin
                           Pass_Message.Destination := Message.Destination;
                           Pass_Message.The_Message := Message.The_Message;
                           Pass_Message.Hop_Counter := 1;
                           Pass_Message.Sender      := Task_Id;
                           -- forward the message
                           for element of Port_List loop
                              if Local_Routing_Table (element.Id).Is_Powered_Down = False then
                                 if element.Id = Local_Routing_Table (Message.Destination).Next_Hop then
                                    select
                                       element.Link.all.Forward_Message (Pass_Message);
                                    or
                                       delay 0.001;
                                       -- Receiver is busy, save into the Holding Queue
                                       -- Put_Line ("Receiver is busy, hold on");
                                       Local_Message_Hold_Queue.Enqueue (Pass_Message);
                                    end select;

                                    exit;
                                 end if;
                              end if;
                           end loop;
                        end;
                     end if;
                  end Send_Message;
               or
                  -- receive a forward message
                  accept Forward_Message         (Message : out Messages_Forward) do

                     -- haven't found the path to the destination
                     if Local_Routing_Table (Message.Destination).Distance = Natural'Invalid_Value then
                        -- Put_Line ("Cannot find the path to the destination");
                        -- save into the Holding Queue
                        Local_Message_Hold_Queue.Enqueue (Message);

                     -- this is the destination, change the message format
                     elsif Task_Id = Message.Destination then

                        Message_Wait_For_Pick_Up.The_Message := Message.The_Message;
                        Message_Wait_For_Pick_Up.Sender      := Message.Sender;
                        Message_Wait_For_Pick_Up.Hop_Counter := Message.Hop_Counter;
                        -- save into the Picking Up Queue
                        Local_Mailbox_Queue.Enqueue (Message_Wait_For_Pick_Up);

                     -- haven't reached the destination, normally forwarding the message
                     else
                        Message.Hop_Counter := Message.Hop_Counter + 1;

                        for element of Port_List loop
                           if Local_Routing_Table (element.Id).Is_Powered_Down = False then
                              if element.Id = Local_Routing_Table (Message.Destination).Next_Hop then
                                 select
                                    element.Link.all.Forward_Message (Message);
                                 or
                                    delay 0.02;
                                    -- Receiver is busy, save into the Holding Queue
                                    Local_Message_Hold_Queue.Enqueue (Message);
                                 end select;

                                 exit;
                              end if;
                           end if;
                        end loop;
                     end if;
                  end Forward_Message;
               or
                  -- receive a Distance Vector Message, check its local routing table
                  accept Distance_Vector_Message (Message : Messages_Routing_Table) do

                     declare
                        Cost_To_Neighbor        : constant Natural := 1;
                        Neighbor_To_Destination : Natural;
                        Calculate_Distance      : Natural;
                     begin
                        for index in Message.This_Routing_Table'Range loop

                           -- check the non-shutdown routers
                           if Message.This_Routing_Table (index).Is_Powered_Down = False and then Local_Routing_Table (index).Is_Powered_Down = False and then Local_Routing_Table (Message.Sender).Is_Powered_Down = False then

                              -- neighbor gets a path to the destination
                              if Message.This_Routing_Table (index).Distance /= Natural'Invalid_Value then

                                 -- if the next hop is not me, check it
                                 if Message.This_Routing_Table (index).Next_Hop /= Task_Id then

                                    -- neighbor knows that router is alive
                                    if Local_Routing_Table (Message.This_Routing_Table (index).Next_Hop).Is_Powered_Down = False then
                                       -- Bellman-Ford Equation
                                       -- dx(y) = min {c(x,v) + dv(y) }

                                       Neighbor_To_Destination := Message.This_Routing_Table (index).Distance;
                                       Calculate_Distance := Cost_To_Neighbor + Neighbor_To_Destination;
                                       -- find shorter path, update the routing table
                                       if Local_Routing_Table (index).Distance = Natural'Invalid_Value or else Local_Routing_Table (index).Distance > Calculate_Distance then
                                          Local_Routing_Table (index).Distance := Calculate_Distance;
                                          Local_Routing_Table (index).Next_Hop := Message.Sender;
                                          Is_Updated := True;
                                          -- Put_Line (Task_Id'Image & "find another path" & Message.Sender'Image & " to" & index'Image);
                                       end if;

                                    else
                                       -- tell it the router is shutdown
                                       Is_Updated := True;
                                    end if;
                                 end if;

                              -- I have a path but neighbor does not
                              elsif Local_Routing_Table (index).Distance /= Natural'Invalid_Value then

                                 -- my shortest path is from that neighbor -> that path is not visible anymore
                                 if Local_Routing_Table (index).Next_Hop = Message.Sender then
                                    Local_Routing_Table (index).Next_Hop        := Router_Range'Invalid_Value;
                                    Local_Routing_Table (index).Distance        := Natural'Invalid_Value;
                                    Is_Updated := True;

                                 -- tell the neighbor I get another path that it needs
                                 else
                                    Is_Updated := True;
                                 end if;
                              end if;

                           -- the router is shutdown
                           else
                              -- I get a new message -> router is powered down
                              if Local_Routing_Table (index).Is_Powered_Down = False then

                                 -- all paths via that router are not visible anymore
                                 for element in Local_Routing_Table'Range loop
                                    if Local_Routing_Table (element).Next_Hop = index then
                                       Local_Routing_Table (element).Next_Hop := Router_Range'Invalid_Value;
                                       Local_Routing_Table (element).Distance := Natural'Invalid_Value;
                                    end if;
                                 end loop;

                                 Local_Routing_Table (index).Is_Powered_Down := True;
                                 Is_Updated := True;

                              -- neighbor doesn't know a router has been powered down -> tell it
                              elsif Message.This_Routing_Table (index).Is_Powered_Down = False then
                                 Is_Updated := True;

                              -- both acknowledge that -> do nothing
                              else
                                 null;
                              end if;
                           end if;
                        end loop;
                     end;
                  end Distance_Vector_Message;
               or
                  -- notified by one of its neighbor, who is powered down
                  accept Power_Down_Message      (Message : Messages_Power_Down) do

                     -- all paths via that router are not visible anymore
                     for element of Local_Routing_Table loop
                        if element.Next_Hop = Message.Sender then
                           element.Next_Hop := Router_Range'Invalid_Value;
                           element.Distance := Natural'Invalid_Value;
                        end if;
                     end loop;

                     -- Put_Line (Task_Id'Image & "find" & Message.Sender'Image & "is shutdown");
                     Local_Routing_Table (Message.Sender).Is_Powered_Down := True;
                     Is_Updated := True;
                  end Power_Down_Message;
               or
                  -- receive the shutdown call, notify its neighbors
                  accept Shutdown do

                     -- Put_Line ("Router" & Router_Range'Image (Task_Id) & "Shutdown");
                     Is_Shutdown := True;
                     -- close the Vector Sender
                     Update_Vector_Sender.Close_Sender;

                     -- notification
                     declare
                        Message : Messages_Power_Down;
                     begin
                        Message.Sender := Task_Id;

                        for element of Port_List loop
                           if Local_Routing_Table (element.Id).Is_Powered_Down = False then
                              element.Link.all.Power_Down_Message (Message);
                           end if;
                        end loop;
                     end;
                  end Shutdown;
               or
                  -- no call received, check the holding messages & handover messages
                  delay 0.001;
               end select;

               -- power down
               exit when Is_Shutdown;

               -- accept Receive_Message only if it gets the message
               if not Local_Mailbox_Queue.Is_Empty then
                  select
                     accept Receive_Message (Message : out Messages_Mailbox) do
                        Local_Mailbox_Queue.Dequeue (Message);
                        -- Put_Line ("Router" & Task_Id'Image & "Receive_Message from" & Message.Sender'Image & "--- Use" & Message.Hop_Counter'Image & " hops");
                     end Receive_Message;
                  or
                     -- no client picks up the message, try next time
                     delay 0.001;
                  end select;
               end if;

               -- if there is any holding message
               if not Local_Message_Hold_Queue.Is_Empty then
                  Receive_Message_Number := Local_Message_Hold_Queue.Queue_Size;

                  -- check every held message
                  for each in 1 .. Receive_Message_Number loop
                     Local_Message_Hold_Queue.Dequeue (Message_Hold);

                     -- if the path is found, send it
                     if Local_Routing_Table (Message_Hold.Destination).Next_Hop /= Router_Range'Invalid_Value then
                        for element of Port_List loop
                           if element.Id = Local_Routing_Table (Message_Hold.Destination).Next_Hop then
                              -- send the message
                              select
                                 element.Link.all.Forward_Message (Message_Hold);
                                 -- Put_Line (Task_Id'Image & "resend to" & Local_Routing_Table (Message_Hold.Destination).Next_Hop'Image);
                              or
                                 -- Receiver is busy, go back to Holding Queue and try next time
                                 delay 0.001;
                                 Local_Message_Hold_Queue.Enqueue (Message_Hold);
                              end select;

                              exit;
                           end if;
                        end loop;

                     -- cannot find the path, go back to Holding Queue
                     else
                        Local_Message_Hold_Queue.Enqueue (Message_Hold);
                     end if;
                  end loop;
               end if;

               -- if the routing table is updated, notify my neighbors
               if Is_Updated then
                  Is_Updated := False;
                  -- give this task to Vector Sender
                  select
                     Update_Vector_Sender.Send_Vector;
                     -- if Update_Vector_Sender is busy, try again next time
                  or
                     delay 0.001;
                     Is_Updated := True;
                  end select;
               end if;
            end loop;
         end;
      end;

      -- graceful degradation -> no response to the other routers once it's powered down
      --                         until there isn't any potential call
      loop
         select
            accept Configure (Links : Ids_To_Links) do
               pragma Unreferenced (Links);
            end Configure;
         or
            accept Send_Message (Message :     Messages_Client) do
               pragma Unreferenced (Message);
            end Send_Message;
         or
            accept Receive_Message (Message : out Messages_Mailbox) do
               pragma Unreferenced (Message);
            end Receive_Message;
         or
            accept Shutdown do
               null;
            end Shutdown;
         or
            accept Distance_Vector_Message (Message : Messages_Routing_Table) do
               pragma Unreferenced (Message);
            end Distance_Vector_Message;
         or
            accept Forward_Message (Message : out Messages_Forward) do
               pragma Unreferenced (Message);
            end Forward_Message;
         or
            accept Power_Down_Message (Message : Messages_Power_Down) do
               pragma Unreferenced (Message);
            end Power_Down_Message;
         or
            terminate;
         end select;
      end loop;

   exception
      when Exception_Id : others => Show_Exception (Exception_Id);
   end Router_Task;

   -- Picking Up Queue -> Protected Queue for Received Message
   protected body Protected_Mailbox_Queue is
      procedure Enqueue (Element : Messages_Mailbox) is
      begin
         Queue (Integer (Tail)) := Element;
         Tail := Tail + 1;
         Empty := False;
      end Enqueue;

      procedure Dequeue (Element : out Messages_Mailbox) is
      begin
         Element := Queue (Integer (Head));
         Head := Head + 1;
         if Head = Tail then
            Empty := True;
         end if;
      end Dequeue;

      function Is_Empty return Boolean is (Empty);
   end Protected_Mailbox_Queue;

   -- Holding Queue -> Protected Queue for Held Message
   protected body Protected_Message_Hold_Queue is
      procedure Enqueue (Element : Messages_Forward) is
      begin
         Queue (Integer (Tail)) := Element;
         Tail  := Tail + 1;
         Empty := False;
         Size  := Size + 1;
      end Enqueue;

      procedure Dequeue (Element : out Messages_Forward) is
      begin
         Element := Queue (Integer (Head));
         Head := Head + 1;
         Size := Size - 1;
         if Head = Tail then
            Empty := True;
         end if;
      end Dequeue;

      function Is_Empty return Boolean is (Empty);
      function Queue_Size return Integer is (Size);
   end Protected_Message_Hold_Queue;

end Generic_Router;
