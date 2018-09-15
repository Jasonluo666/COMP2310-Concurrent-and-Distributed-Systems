with Ada.Numerics.Discrete_Random; use Ada.Numerics;
with Ada.Text_IO;                  use Ada.Text_IO;

procedure Token_Ring is

   No_of_Nodes       : constant Positive := 8;
   Elements_per_Node : constant Positive := 10_000;

   type Element is new Long_Integer;

   Size : constant Positive := Elements_per_Node * No_of_Nodes;
   subtype Index is Positive range 1 .. Size;

   package Random_Elements is new Discrete_Random (Element);
   use Random_Elements;

   type Nodes is mod No_of_Nodes;

   task type Node is
      entry Handover_Id (Assigned_Id : Nodes);
      entry Token;
   end Node;

   Ring : array (Nodes) of Node;

   Random_Field : array (Index) of Element := (others => Element'Invalid_Value);
   Global_Max   : Element                  := Element'First;

   Element_Generator : Generator;

   function Partition_First (Id : Nodes) return Index is (Index'First +  Natural (Id)      * Elements_per_Node);
   function Partition_Last  (Id : Nodes) return Index is (Index'First + (Natural (Id) + 1) * Elements_per_Node - 1);

   task body Node is

      Id : Nodes := Nodes'Invalid_Value;

   begin
      accept Handover_Id (Assigned_Id : Nodes) do
         Id := Assigned_Id;
      end Handover_Id;

      declare
         Next      : constant Nodes   := Id + 1;
         Local_Max :          Element := Element'First;

         subtype Partition is Index range Partition_First (Id) .. Partition_Last (Id);

      begin
         accept Token;

         Ring (Next).Token;
--         if Id = 0 then
--            delay 10.0;
--         end if;

         for e of Random_Field (Partition) loop
            Local_Max := Element'Max (Local_Max, e);
         end loop;

         Put_Line ("Task" & Nodes'Image (Id) & " reports a local maximum of:" & Element'Image (Local_Max));

         accept Token;

         Global_Max := Element'Max (Global_Max, Local_Max);

         Put_Line ("Task" & Nodes'Image (Id) & " set a global maximum of:" & Element'Image (Global_Max));

         if Id /= Nodes'Last then
            Ring (Next).Token;
         end if;
      end;
   end Node;

begin
   Reset (Element_Generator);
   for e of Random_Field loop
      e := Random (Element_Generator);
   end loop;

   for n in Nodes loop
      Ring (n).Handover_Id (n);
   end loop;

   Ring (Ring'First).Token;
end Token_Ring;

