with Ada.Task_Identification;    use Ada.Task_Identification;

package Vehicle_Task_Type is

   task type Vehicle_Task is
      entry Identify (Set_Vehicle_No : Positive; Local_Task_Id : out Task_Id);
   end Vehicle_Task;

end Vehicle_Task_Type;
