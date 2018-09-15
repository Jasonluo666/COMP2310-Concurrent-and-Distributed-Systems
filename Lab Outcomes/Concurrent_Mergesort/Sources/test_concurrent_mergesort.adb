with Ada.Numerics.Discrete_Random;
with Ada.Long_Integer_Text_IO;     use Ada.Long_Integer_Text_IO;
with Ada.Real_Time;                use Ada.Real_Time;
with Ada.Text_IO;                  use Ada.Text_IO;
with Concurrent_Mergesort;
with Sorting_Tests;

procedure Test_Concurrent_Mergesort is

   Field_Size : constant Positive := 50_000;
   subtype Field_Range is Positive range 1 .. Field_Size;

   subtype Element_Type is Natural;
   type Field_Type is array (Field_Range range <>) of Element_Type;

   Null_Field : Field_Type (0 .. -1);

   package RandomElements is new Ada.Numerics.Discrete_Random (Element_Type);
   use RandomElements;

   procedure Merge_Sort_Concurrent is new Concurrent_Mergesort (Element_Type, Field_Range, Field_Type);

   package Element_Sorting_Tests is new Sorting_Tests (Element       => Element_Type,
                                                       Index         => Field_Range,
                                                       Element_Array => Field_Type);
   use Element_Sorting_Tests;

   procedure Check_Field (Sort_Field     : Field_Type;
                          Original_Field : Field_Type := Null_Field) is

   begin
      New_Line;
      Put_Line ((if Is_Sorted (Sort_Field)
                then "----- Field is sorted "
                else "----- Field is NOT sorted ") &
                (if Original_Field = Null_Field
                   then "-----"
                   elsif Is_Permutation (Sort_Field, Original_Field)
                   then "and a permutation of input -----"
                   else "and NOT a permutation of input -----"));
      New_Line;
   end Check_Field;

   procedure Print_Time_Taken (Taken : Time_Span) is

   begin
      Put ("Time taken: ");
      Put (Long_Integer (Long_Float'Floor (Long_Float               (To_Duration (Taken)))),          4); Put (" s ");
      Put (Long_Integer (Long_Float'Floor (Long_Float     (1_000.0 * To_Duration (Taken)))) mod 1000, 4); Put (" ms ");
      Put (Long_Integer (Long_Float'Floor (Long_Float (1_000_000.0 * To_Duration (Taken)))) mod 1000, 4); Put (" micro-s ");
   end Print_Time_Taken;

   Random_Field      : Field_Type (Field_Range);
   Element_Generator : Generator;

begin
   Reset (Element_Generator);
   for ix in Random_Field'Range loop
      Random_Field (ix) := Random (Element_Generator);
   end loop;

   Check_Field (Random_Field);

   declare
      Sort_Field : Field_Type := Random_Field;
      Sort_Start,
      Sort_End   : Time;

   begin
      Put_Line ("Concurrent mergesort algorithm at work ...");

      Sort_Start := Clock;
      Merge_Sort_Concurrent (Sort_Field);
      Sort_End  := Clock;

      Print_Time_Taken (Sort_End - Sort_Start); Put_Line (" for" & Field_Range'Image (Field_Size) & " Elements");

      Check_Field (Sort_Field, Random_Field);

      if not Is_Sorted (Sort_Field) or else not Is_Permutation (Sort_Field, Random_Field) then
         raise Program_Error with "Tests failed";
      end if;
   end;
end Test_Concurrent_Mergesort;
