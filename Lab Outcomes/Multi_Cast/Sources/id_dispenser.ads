generic
   type Element is new Positive;
package Id_Dispenser is
   protected Dispenser is
      procedure Draw_Id (Id : out Element);

   private
      Unique_ID : Element := Element'First;
   end Dispenser;

end Id_Dispenser;
