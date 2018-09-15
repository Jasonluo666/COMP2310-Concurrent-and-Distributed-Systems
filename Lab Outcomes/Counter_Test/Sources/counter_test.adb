with Ada.Text_IO; use Ada.Text_IO;

procedure Counter_Test is

   Sum : Natural := 50;

   task type Counter (Id : Positive; Goal : Natural);

   task body Counter is

   begin
      while Sum /= Goal loop
         Sum := (if Sum > Goal then Sum - 1 else Sum + 1);
         Put (Natural'Image (Sum));
         delay 0.0; -- try leaving out this delay statement!
      end loop;

      New_Line;
      Put_Line ("Counter task" & Positive'Image (Id) & " terminates with sum being:" & Natural'Image (Sum));
   end Counter;

   Counter_1 : Counter (1, 30);
   Counter_2 : Counter (2, 40);
   Counter_3 : Counter (3, 60);
   Counter_4 : Counter (4, 70);

begin
   New_Line;
   Put_Line ("Counter_Test terminates with sum being:" & Natural'Image (Sum));
end Counter_Test;
