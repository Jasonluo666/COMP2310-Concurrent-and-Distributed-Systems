with Ada.Containers.Vectors; use Ada.Containers;

package body Sorting_Tests is

   ---------------
   -- Is_Sorted --
   ---------------

   function Is_Sorted (Field : Element_Array) return Boolean is

   begin
      for ix in Field'First .. Index'Pred (Field'Last) loop
         if Field (Index'Succ (ix)) < Field (ix) then
            return False;
         end if;
      end loop;
      return True;
   end Is_Sorted;

   --------------------
   -- Is_Permutation --
   --------------------

   function Is_Permutation (Field_A, Field_B : Element_Array) return Boolean is

      package Field_Vectors is new Vectors (Positive, Element);
      use Field_Vectors;

      package Field_Vectors_Sorting is new Generic_Sorting;
      use Field_Vectors_Sorting;

      Vector_A, Vector_B : Vector := Empty_Vector;

   begin
      for i in Field_A'Range loop
         Append (Vector_A, Field_A (i));
      end loop;
      for i in Field_B'Range loop
         Append (Vector_B, Field_B (i));
      end loop;
      Sort (Vector_A);
      Sort (Vector_B);
      return Vector_A = Vector_B;
   end Is_Permutation;

end Sorting_Tests;
