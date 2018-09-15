--
-- Uwe R. Zimmer, Australia, 2015
--

with Queue_Pack_Private; use Queue_Pack_Private;
with Ada.Text_IO;        use Ada.Text_IO;

procedure Queue_Test_Private is

   Queue_1,
   Queue_2      : Queue_Type;
   Current_Item : Element;

begin
   -- Queue_2 := Queue_1;

   Enqueue (Item => 1_000, Queue => Queue_1);
   Enqueue (Item => 2_000, Queue => Queue_1);
   Enqueue (Item => 3_000, Queue => Queue_1);
   Dequeue (Current_Item, Queue_1);
   Put_Line ("Current_Item: " & Element'Image (Current_Item));
   Dequeue (Current_Item, Queue_1);
   Put_Line ("Current_Item: " & Element'Image (Current_Item));
   Dequeue (Current_Item, Queue_1);
   Put_Line ("Current_Item: " & Element'Image (Current_Item));

   Enqueue (Current_Item, Queue_2);
   -- Dequeue (Current_Item, Queue_2);
   Put_Line ("Current_Item: " & Element'Image (Current_Item));

   Put_Line ("Queue_1 is " & (if Is_Empty (Queue_1) then "" else "not ") & "empty on exit");
   Put_Line ("Queue_2 is " & (if Is_Empty (Queue_2) then "" else "not ") & "empty on exit");

exception
   when Queue_underflow => Put ("Queue underflow");
   when Queue_overflow  => Put ("Queue overflow");
end Queue_Test_Private;
