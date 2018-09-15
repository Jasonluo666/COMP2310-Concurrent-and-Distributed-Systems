-- repair this program according to the lab sheet.

with Ada.Text_IO; use Ada.Text_IO;

procedure Counter_Test_Synchronized is

   -- Mutual exclusion -> Bakery algorithm
   Task_Number : constant Positive := 10;
   type Task_Range is mod Task_Number;
   State : array (Task_Range) of Boolean := (others => False);
   type Natural_Array is array (Task_Range) of Natural;
   Ticket : Natural_Array := (others => 0);
   -- end

   Sum : Natural := 17;
   -- function Max
   function Max (temp_array : Natural_Array) return Natural is
      local_max : Natural := 0;
   begin
      for element in Task_Range loop
         if local_max < temp_array (element) then
            local_max := temp_array (element);
         end if;
      end loop;

      return local_max;
   end Max;

   task type Counter (Current_ID : Task_Range; Goal : Natural);

   task body Counter is

   begin
      while Sum /= Goal loop
         -- Mutual part
         State (Current_ID) := True;
         Ticket (Current_ID) := Max (Ticket) + 1;
         State (Current_ID) := False;

         for id in Task_Range loop
            if id /= Current_ID then
               loop
                  exit when not State (id);
               end loop;
               loop
                  exit when (Ticket (id) = 0)
                    or else (Ticket (Current_ID) < Ticket (id))
                    or else (Ticket (Current_ID) = Ticket (id) and then Current_ID < id);
               end loop;
            end if;
         end loop;
         -- end
         Sum := (if Sum > Goal then Sum - 1 else Sum + 1);
         Put (Natural'Image (Sum));

         if Sum = Goal then
            New_Line;
            Put_Line ("Counter task" & Task_Range'Image (Current_ID) & " terminates with sum being:" & Natural'Image (Sum));
            Ticket (Current_ID) := 0;
            exit;
         end if;
         -- Mutual part
         Ticket (Current_ID) := 0;
         -- end
         delay 0.0; -- try leaving out this delay statement!
      end loop;

   end Counter;

   Counter_1 : Counter (1, 10);
   Counter_2 : Counter (2, 15);
   Counter_3 : Counter (3, 20);
   Counter_4 : Counter (4, 25);
   Counter_5 : Counter (5, 30);
   -- Counter_6 : Counter (6, 35);
   -- Counter_7 : Counter (7, 40);
   -- Counter_8 : Counter (8, 45);
   -- Counter_9 : Counter (9, 50);
   -- Counter_10 : Counter (0, 55);

begin
   New_Line;
   Put_Line ("Counter_Test terminates with sum being:" & Natural'Image (Sum));
end Counter_Test_Synchronized;
