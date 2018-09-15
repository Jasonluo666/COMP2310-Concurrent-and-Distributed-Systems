package body Semaphores is

   protected body Binary_Semaphore is

      entry Wait when semaphore = True is
      begin
         semaphore := False;
      end Wait;

      entry Signal when semaphore = False is
      begin
         semaphore := True;
      end Signal;

   end Binary_Semaphore;

end Semaphores;
