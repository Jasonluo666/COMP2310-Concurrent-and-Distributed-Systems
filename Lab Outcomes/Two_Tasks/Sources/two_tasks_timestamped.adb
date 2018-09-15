-- Complete this procedure according to the lab sheet
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;

procedure Two_Tasks_Timestamped is

   Start_Up_Time : constant Time := Clock;
   Now : Time;
   Delay_Period_Main : Duration := 0.5;

   Mutual : Boolean := False;

   task First_One;
   task Second_One;

   task body First_One is
      Now1 : Time;
         Delay_Period : Duration := 0.5;
   begin

      Put ("Hello .. ");
      Put_Line ("and goodbye world from task 1");
      Now1 := Clock;
      -- mutex
      loop
         delay until Start_Up_Time + Delay_Period;
         exit when Mutual = False;

         Delay_Period := Delay_Period + 0.5;
      end loop;
      Mutual := True;

      Put ("First_One finished output at : ");
      Put (Day_Number'Image   (Day     (Now)) & ".");
      Put (Month_Number'Image (Month   (Now)) & ".");
      Put (Year_Number'Image  (Year    (Now)) & " at");
      Put (Day_Duration'Image (Seconds (Now)) & " seconds - Seconds since start up:");
      Put (Duration'Image (Now1 - Start_Up_Time));
      New_Line;

      Mutual := False;

   end First_One;

   task body Second_One is
      Now2 : Time;
         Delay_Period : Duration := 0.5;
   begin

      Put ("Hello .. ");
      Put_Line ("and goodbye world from task 2");
      Now2 := Clock;
      -- mutex
      loop
         delay until Start_Up_Time + Delay_Period;
         exit when Mutual = False;

         Delay_Period := Delay_Period + 0.5;
      end loop;
      Mutual := True;

      Put ("Second_One finished output at : ");
      Put (Day_Number'Image   (Day     (Now)) & ".");
      Put (Month_Number'Image (Month   (Now)) & ".");
      Put (Year_Number'Image  (Year    (Now)) & " at");
      Put (Day_Duration'Image (Seconds (Now)) & " seconds - Seconds since start up:");
      Put (Duration'Image (Now2 - Start_Up_Time));
      New_Line;

      Mutual := False;

   end Second_One;

begin

   Put ("Hello .. ");
   Put_Line ("and goodbye world from Two_Tasks");
   Now := Clock;
   -- mutex
   loop
      delay until Start_Up_Time + Delay_Period_Main;
         exit when Mutual = False;

         Delay_Period_Main := Delay_Period_Main + 0.5;
   end loop;
   Mutual := True;

   Put ("Main_Process finished output at : ");
   Put (Day_Number'Image   (Day     (Now)) & ".");
   Put (Month_Number'Image (Month   (Now)) & ".");
   Put (Year_Number'Image  (Year    (Now)) & " at");
   Put (Day_Duration'Image (Seconds (Now)) & " seconds - Seconds since start up:");
   Put (Duration'Image (Now - Start_Up_Time));
   New_Line;

   Mutual := False;
end Two_Tasks_Timestamped;
