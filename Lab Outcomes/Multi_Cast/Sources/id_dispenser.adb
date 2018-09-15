-- with Ada.Text_IO;    use Ada.Text_IO;

package body Id_Dispenser is
   protected body Dispenser is
      procedure Draw_Id (Id : out Element) is
      begin
         -- Put_Line ("I give" & Unique_ID'Image);
         Id := Unique_ID;
         if Unique_ID /= Element'Last then
            Unique_ID := Element'Succ (Unique_ID);
         end if;

      end Draw_Id;
   end Dispenser;

end Id_Dispenser;
