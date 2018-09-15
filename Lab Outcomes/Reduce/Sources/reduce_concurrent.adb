function Reduce_Concurrent (A : Element_Array) return Element is

   task type Combiner (Slice_Begin, Slice_End : Index) is
      entry Combination (E : out Element);
   end Combiner;

   task body Combiner is
      Result : constant Element := Reduce_Concurrent (A (Slice_Begin .. Slice_End));
   begin
      accept Combination (E : out Element) do
         E := Result;
      end Combination;
   end Combiner;

   Middle  : constant Index := Index'Val (Index'Pos (A'First) + A'Length / 2);
   Result1 : Element;
   Result2 : Element;

begin
   if A'Length = 1 then
      return A (A'First);
   elsif A'Length = 2 then
      return Combine (A (A'First), A (A'Last));
   else
      declare
         Concurrent_Combiner_first  : Combiner (A'First, Index'Pred (Middle));
         Concurrent_Combiner_second : Combiner (Middle, A'Last);
      begin
         Concurrent_Combiner_first.Combination (Result1);
         Concurrent_Combiner_second.Combination (Result2);
         return Combine (Result1, Result2);
      end;

   end if;

end Reduce_Concurrent;
