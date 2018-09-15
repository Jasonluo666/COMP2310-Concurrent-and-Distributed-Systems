with Ada.Text_IO;  use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;

procedure Timestamp is

   No_of_Iterations    : constant Positive := 10;
   Delay_Per_Iteration : constant Duration := 1.0;

   Start_Up_Time : constant Time := Clock;

   subtype Repeat_for is Positive range 1 .. No_of_Iterations;

begin
   for i in Repeat_for loop
      declare
         Now : constant Time := Clock;
      begin
         Put (Day_Number'Image   (Day     (Now)) & ".");
         Put (Month_Number'Image (Month   (Now)) & ".");
         Put (Year_Number'Image  (Year    (Now)) & " at");
         Put (Day_Duration'Image (Seconds (Now)) & " seconds - Seconds since start up:");
         Put (Duration'Image (Now - Start_Up_Time));
         New_Line;
         delay Delay_Per_Iteration;
      end;
   end loop;
end Timestamp;
