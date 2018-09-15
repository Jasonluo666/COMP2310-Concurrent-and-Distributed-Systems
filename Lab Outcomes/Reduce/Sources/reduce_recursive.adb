function Reduce_Recursive (A : Element_Array) return Element is

begin
   return
     (if    A'Length = 1 then A (A'First)
      elsif A'Length = 2 then Combine (A (A'First), A (A'Last))
                         else Combine (A (A'First), Reduce_Recursive (A (Index'Succ (A'First) .. A'Last))));
end Reduce_Recursive;
