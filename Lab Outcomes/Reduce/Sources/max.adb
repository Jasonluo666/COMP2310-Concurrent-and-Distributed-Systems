with Ada.Numerics.Discrete_Random; use Ada.Numerics;
with Ada.Text_IO;                  use Ada.Text_IO;
with Reduce_Concurrent;
with Reduce_Iterative;
with Reduce_Recursive;

procedure Max is

   type Element is new Natural;

   Size : constant Positive := 1_001;
   subtype Index is Positive range 1 .. Size;

   type Element_Array is array (Index range <>) of Element;

   package Random_Elements is new Discrete_Random (Element);
   use Random_Elements;

   function Max_Concurrent is new Reduce_Concurrent (Element, Index, Element_Array, Element'Max);
   function Max_Iterative  is new Reduce_Iterative  (Element, Index, Element_Array, Element'Max);
   function Max_Recursive  is new Reduce_Recursive  (Element, Index, Element_Array, Element'Max);

   Random_Field      : Element_Array (Index);
   Element_Generator : Generator;

begin
   Reset (Element_Generator);
   for e of Random_Field loop
      e := Random (Element_Generator);
   end loop;

   declare
      Max_Concurrent_Result : constant Element := Max_Concurrent (Random_Field);
      Max_Iterative_Result  : constant Element := Max_Iterative  (Random_Field);
      Max_Recursive_Result  : constant Element := Max_Recursive  (Random_Field);

   begin
      Put_Line ("Max (concurrent):" & Element'Image (Max_Concurrent_Result));
      Put_Line ("Max (iterative) :" & Element'Image (Max_Iterative_Result));
      Put_Line ("Max (recursive) :" & Element'Image (Max_Recursive_Result));

      if Max_Concurrent_Result = Max_Iterative_Result
        and then Max_Iterative_Result = Max_Recursive_Result
      then
         Put_Line ("All results matching - seems fine as a quick sanity check");
      else
         raise Program_Error with "Results are not matching";
      end if;
   end;
end Max;
