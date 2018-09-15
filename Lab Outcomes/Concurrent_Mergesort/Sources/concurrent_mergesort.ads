generic

   type Element       is private;
   type Index         is (<>);
   type Element_Array is array (Index range <>) of Element;

   with function "<" (Left, Right : Element) return Boolean is <>;

procedure Concurrent_Mergesort (Sort_Field : in out Element_Array);
