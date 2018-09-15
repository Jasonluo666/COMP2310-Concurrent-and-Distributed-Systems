generic

   type Element       is private;
   type Index         is (<>);
   type Element_Array is array (Index range <>) of Element;

   with function Combine (Left, Right : Element) return Element is <>;

function Reduce_Concurrent (A : Element_Array) return Element;
