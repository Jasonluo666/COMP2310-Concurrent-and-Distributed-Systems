generic
   type Element is private;
   type Stack_Size is mod <>;
package Stack_Pack_Generic is

   type Stack_Type is private;

   procedure Push (Item :     Element; Stack : in out Stack_Type);
   procedure Pop (Item : out Element; Stack : in out Stack_Type);

   function Is_Empty (Stack : Stack_Type) return Boolean;
   function Is_Full  (Stack : Stack_Type) return Boolean;

   Stack_overflow, Stack_underflow : exception;

private
   type List is array (Stack_Size) of Element;
   type Stack_Type is record
      Botton, Top : Stack_Size  := Stack_Size'First;
      Is_Empty  : Boolean := True;
      Elements  : List;
   end record;
end Stack_Pack_Generic;
