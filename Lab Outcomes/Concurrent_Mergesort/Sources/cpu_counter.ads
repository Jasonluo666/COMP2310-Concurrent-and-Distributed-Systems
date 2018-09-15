with System.Multiprocessors; use System.Multiprocessors;

package CPU_Counter is

   CPUs_Potentially_Available : Boolean := True;

   protected CPU_Count is
      procedure Try_Check_One_Out (Got_One : out Boolean);
   private
      Available_CPUs : CPU := Number_Of_CPUs;
   end CPU_Count;

end CPU_Counter;
