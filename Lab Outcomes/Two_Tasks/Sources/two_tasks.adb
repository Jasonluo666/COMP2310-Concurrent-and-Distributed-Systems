with Ada.Text_IO; use Ada.Text_IO;

procedure Two_Tasks is

   task First_One;
   task Second_One;

   task body First_One is

   begin
      Put ("Hello .. ");
      Put_Line ("and goodbye world from task 1");
   end First_One;

   task body Second_One is

   begin
      Put ("Hello .. ");
      Put_Line ("and goodbye world from task 2");
   end Second_One;

begin
   Put ("Hello .. ");
   Put_Line ("and goodbye world from Two_Tasks");
end Two_Tasks;
