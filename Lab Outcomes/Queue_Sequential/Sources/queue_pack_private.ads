--
-- Uwe R. Zimmer, Australia, 2015
--

package Queue_Pack_Private is

   Queue_Size : constant Positive := 10;

   type Element is range 1_000 .. 24_000;
   type Queue_Type is limited private;

   procedure Enqueue (Item :     Element; Queue : in out Queue_Type);
   procedure Dequeue (Item : out Element; Queue : in out Queue_Type);

   function Is_Empty (Queue : Queue_Type) return Boolean;
   function Is_Full  (Queue : Queue_Type) return Boolean;

   Queue_overflow, Queue_underflow : exception;

private
   type Marker is mod Queue_Size;
   type List is array (Marker) of Element;
   type Queue_Type is record
      Top, Free : Marker  := Marker'First;
      Is_Empty  : Boolean := True;
      Elements  : List;
   end record;
end Queue_Pack_Private;
