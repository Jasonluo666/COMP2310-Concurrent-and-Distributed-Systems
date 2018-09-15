with Ada.Exceptions; use Ada.Exceptions;
with Ada.Text_IO;    use Ada.Text_IO;
with CPU_Counter;    use CPU_Counter;

procedure Concurrent_Mergesort (Sort_Field : in out Element_Array) is

   procedure Mergesort (F : in out Element_Array) is

   begin
      if F'Length > 1 then
         declare
            Middle : constant Index := Index'Val (Index'Pos (F'First) + F'Length / 2);

            subtype Low_Range  is Index range F'First .. Index'Pred (Middle);
            subtype High_Range is Index range Middle  .. F'Last;

            F_Low  : aliased Element_Array := F (Low_Range);
            F_High : aliased Element_Array := F (High_Range);

            Gained_Agent : Boolean := False;

--            task type Concurrent_Mergesort;
--            type Concurrent_Mergesort_PTR is access Concurrent_Mergesort;
--            task body Concurrent_Mergesort is
--            begin
--               Mergesort (F_Low);
--            end Concurrent_Mergesort;

         begin
            if CPUs_Potentially_Available then
               CPU_Count.Try_Check_One_Out (Gained_Agent);
            end if;

            if Gained_Agent then

               declare
                  task Concurrent_Mergesort;
                  task body Concurrent_Mergesort is
                  begin
                     Mergesort (F_Low);
                  end Concurrent_Mergesort;
               begin
                  Mergesort (F_High);
               end;

            else
               Mergesort (F_Low);
               Mergesort (F_High);
            end if;

            declare
               Low          : Low_Range  := Low_Range'First;
               High         : High_Range := High_Range'First;
               Low_Element  : Element    := F_Low  (Low);
               High_Element : Element    := F_High (High);

            begin
               Merge : for i in F'Range loop

                  if Low_Element < High_Element then
                     F (i) := Low_Element;
                     if Low = F_Low'Last then
                        F (Index'Succ (i) .. F'Last) := F_High (High .. F_High'Last);
                        exit Merge;
                     else
                        Low  := Index'Succ (Low); Low_Element  := F_Low (Low);
                     end if;
                  else
                     F (i) := High_Element;
                     if High = F_High'Last then
                        F (Index'Succ (i) .. F'Last) := F_Low (Low .. F_Low'Last);
                        exit Merge;
                     else
                        High := Index'Succ (High); High_Element := F_High (High);
                     end if;
                  end if;
               end loop Merge;
            end;
         end;
      end if;
   end Mergesort;

begin
   Mergesort (Sort_Field);
end Concurrent_Mergesort;
