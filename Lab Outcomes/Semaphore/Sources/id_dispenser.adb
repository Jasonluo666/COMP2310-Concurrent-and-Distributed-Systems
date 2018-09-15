package body Id_Dispenser is
   protected body Dispenser is
      procedure Draw_Id (Id : in out Element) is
      begin
         Id := Unique_ID;
         Unique_ID := Element'Succ (Unique_ID);

      end Draw_Id;
   end Dispenser;

end Id_Dispenser;
