-- Student ID : U6488845
-- Author: Jiangshan Luo
-- Lab 1: means.adb

with Ada.Text_IO;
use Ada.Text_IO;

procedure means is
   -- Test data: Please update the "data_num" while changing the number of input data
   type Number is digits 5;
   type Numbers is array (Positive range <>) of Number;
   Test_Numbers : constant Numbers := (10.0, 20.0, 30.0, 40.0, 50.0);
   data_num : Integer := 5;

   -- Task Declaration
   task Arithmetic_Mean is
      entry Result;
   end Arithmetic_Mean;

   task Harmonic_Mean is
      entry Result;
   end Harmonic_Mean;

   -- Arithmetic_Mean
   task body Arithmetic_Mean is
      sum : Number := 0.0;
   begin

      accept Result do
         for i in 1 .. data_num loop
            sum := sum + Test_Numbers (i);
         end loop;

         sum := sum / Number (data_num);
         Put_Line ("Arithmetic_Mean is:" & Number'Image (sum));
      end Result;

   end Arithmetic_Mean;

   -- Harmonic_Mean
   task body Harmonic_Mean is
      sum : Number := 0.0;
   begin

      accept Result do
         for i in 1 .. data_num loop
            sum := sum + 1.0 / Test_Numbers (i);
         end loop;

         sum := Number (data_num) / sum;
         Put_Line ("Harmonic_Mean is:" & Number'Image (sum));
      end Result;

   end Harmonic_Mean;
begin

   Put_Line ("There are " & Integer'Image (data_num) & " test numbers.");
   Put_Line ("The input data: ");
   for i in 1 .. data_num loop
      Put (Number'Image (Test_Numbers (i)));
      Put (" ");
   end loop;
   New_Line;

   -- Concurrent calculating
   Arithmetic_Mean.Result;
   Harmonic_Mean.Result;

end means;
