with Stack_Pack_Generic;
with Ada.Text_IO;        use Ada.Text_IO;

procedure Stack_Test_Generic is
   type Size is mod 10;
   package Stack_Pack_Integer is new Stack_Pack_Generic (Element => Integer, Stack_Size => Size);
   use Stack_Pack_Integer;

   Stack_1,
   Stack_2      : Stack_Type;
   Current_Item : Integer;

begin

   Push (Item => 1_000, Stack => Stack_1);
   Put_Line ("Push: 1000 in Stack_1");
   Push (Item => 2_000, Stack => Stack_1);
   Put_Line ("Push: 2000 in Stack_1");
   Push (Item => 3_000, Stack => Stack_1);
   Put_Line ("Push: 3000 in Stack_1");
   Push (Item => 4_000, Stack => Stack_1);
   Put_Line ("Push: 4000 in Stack_1");
   Push (Item => 5_000, Stack => Stack_1);
   Put_Line ("Push: 5000 in Stack_1");
   Push (Item => 6_000, Stack => Stack_1);
   Put_Line ("Push: 6000 in Stack_1");

   Pop (Current_Item, Stack_1);
   Put_Line ("Current_Item: " & Integer'Image (Current_Item));
   Pop (Current_Item, Stack_1);
   Put_Line ("Current_Item: " & Integer'Image (Current_Item));
   Pop (Current_Item, Stack_1);
   Put_Line ("Current_Item: " & Integer'Image (Current_Item));
   Pop (Current_Item, Stack_1);
   Put_Line ("Current_Item: " & Integer'Image (Current_Item));
   Pop (Current_Item, Stack_1);
   Put_Line ("Current_Item: " & Integer'Image (Current_Item));
   Pop (Current_Item, Stack_1);
   Put_Line ("Current_Item: " & Integer'Image (Current_Item));

   Push (Current_Item, Stack_2);
   Put_Line ("Push: " & Integer'Image (Current_Item) & " in Stack_2");

   Put_Line ("Stack_1 is " & (if Is_Empty (Stack_1) then "" else "not ") & "empty on exit");
   Put_Line ("Stack_2 is " & (if Is_Empty (Stack_2) then "" else "not ") & "empty on exit");

exception
   when Stack_underflow => Put ("Stack underflow");
   when Stack_overflow  => Put ("Stack overflow");
end Stack_Test_Generic;
