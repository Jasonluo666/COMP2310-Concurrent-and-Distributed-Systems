package body CPU_Counter is

   protected body CPU_Count is

      procedure Try_Check_One_Out (Got_One : out Boolean) is

      begin
         Got_One                    := Available_CPUs > 1;
         Available_CPUs             := CPU'Max (CPU'First, CPU'Pred (Available_CPUs));
         CPUs_Potentially_Available := Available_CPUs > 1;
      end Try_Check_One_Out;

   end CPU_Count;

end CPU_Counter;
