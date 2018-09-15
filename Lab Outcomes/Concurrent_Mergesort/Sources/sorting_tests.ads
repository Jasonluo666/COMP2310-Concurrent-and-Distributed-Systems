generic

   type Element       is private;
   type Index         is (<>);
   type Element_Array is array (Index range <>) of Element;

   with function "<"  (Left, Right : Element) return Boolean is <>;
   with function "="  (Left, Right : Element) return Boolean is <>;

package Sorting_Tests is

   function Is_Sorted (Field : Element_Array) return Boolean;

   function Is_Permutation (Field_A, Field_B : Element_Array) return Boolean;

end Sorting_Tests;
