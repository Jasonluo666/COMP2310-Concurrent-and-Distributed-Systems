with Ada.Text_IO;  use Ada.Text_IO;
with Id_Dispenser;
with Semaphores;   use Semaphores;

procedure Philos is

   No_of_Philos : constant Positive := 5;
   Meditation   : constant Duration := 0.0;

   type Table_Ix is mod No_of_Philos;

   Forks : array (Table_Ix) of Binary_Semaphore (Initially_Available => True);

   package Index_Dispenser is new Id_Dispenser (Element => Table_Ix);
   use Index_Dispenser;

   task type Philo;
   task body Philo is

      Philo_Nr : Table_Ix;

   begin
      Dispenser.Draw_Id (Id => Philo_Nr);
      Put_Line ("Philosopher" & Table_Ix'Image (Philo_Nr) & " looks for forks.");
      Forks (Philo_Nr).Wait; delay Meditation; Forks (Philo_Nr + 1).Wait;
      Put_Line ("Philosopher" & Table_Ix'Image (Philo_Nr) & " eats.");
      Forks (Philo_Nr).Signal; Forks (Philo_Nr + 1).Signal;
      Put_Line ("Philosopher" & Table_Ix'Image (Philo_Nr) & " dropped forks.");
   end Philo;

   Table : array (Table_Ix) of Philo; pragma Unreferenced (Table);

begin
   null;
end Philos;
