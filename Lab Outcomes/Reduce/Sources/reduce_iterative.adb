function Reduce_Iterative (A : Element_Array) return Element is

   Combination : Element := A (A'First);

begin
   for e of A (Index'Succ (A'First) .. A'Last) loop
      Combination := Combine (e, Combination);
   end loop;
   return Combination;
end Reduce_Iterative;
