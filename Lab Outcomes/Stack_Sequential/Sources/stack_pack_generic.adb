package body Stack_Pack_Generic is

   procedure Push (Item : Element; Stack : in out Stack_Type) is

   begin
      if Is_Full (Stack) then
         raise Stack_overflow;
      end if;

      Stack.Elements (Stack.Top) := Item;
      Stack.Top     := Stack.Top + 1;
      Stack.Is_Empty := False;
   end Push;

   -- DeStack
   procedure Pop (Item : out Element; Stack : in out Stack_Type) is

   begin
      if Is_Empty (Stack) then
         raise Stack_underflow;
      end if;

      Stack.Top      := Stack.Top - 1;
      Item           := Stack.Elements (Stack.Top);

      if Is_Empty (Stack) then
         Stack.Is_Empty := True;
      end if;
   end Pop;

   function Is_Full (Stack : Stack_Type) return Boolean is
     (not Stack.Is_Empty and then Stack.Top = Stack.Botton);

   -- Is_Empty
   function Is_Empty (Stack : Stack_Type) return Boolean is
     (Stack.Top = Stack.Botton);

end Stack_Pack_Generic;
