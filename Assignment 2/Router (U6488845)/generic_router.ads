--
--  Framework: Uwe R. Zimmer, Australia, 2015
--

with Generic_Message_Structures;
with Generic_Router_Links;
with Id_Dispenser;

generic

   with package Message_Structures is new Generic_Message_Structures (<>);

package Generic_Router is

   use Message_Structures;
   use Routers_Configuration;

   package Router_Id_Generator is new Id_Dispenser (Element => Router_Range);
   use Router_Id_Generator;

   type Router_Task;
   type Router_Task_P is access all Router_Task;

   package Router_Link is new Generic_Router_Links (Router_Range, Router_Task_P, null);
   use Router_Link;

   -- Picking Up Queue -> Protected Queue for Received Message
   type Mailbox_Queue is array (1 .. 100) of Messages_Mailbox;
   type Queue_Index is mod 100;
   protected type Protected_Mailbox_Queue is
      procedure Enqueue (Element : Messages_Mailbox);
      procedure Dequeue (Element : out Messages_Mailbox);
      function Is_Empty return Boolean;
   private
      Queue    : Mailbox_Queue;
      Head     : Queue_Index   := 1;
      Tail     : Queue_Index   := 1;
      Empty    : Boolean       := True;
   end Protected_Mailbox_Queue;

   -- Holding Queue -> Protected Queue for Held Message
   type Message_Hold_Queue is array (1 .. 100) of Messages_Forward;
   protected type Protected_Message_Hold_Queue is
      procedure Enqueue (Element : Messages_Forward);
      procedure Dequeue (Element : out Messages_Forward);
      function Is_Empty return Boolean;
      function Queue_Size return Integer;
   private
      Queue    : Message_Hold_Queue;
      Head     : Queue_Index   := 1;
      Tail     : Queue_Index   := 1;
      Empty    : Boolean       := True;
      Size     : Integer       := 0;
   end Protected_Message_Hold_Queue;

   task type Router_Task (Task_Id  : Router_Range := Draw_Id) is

      entry Configure (Links : Ids_To_Links);

      entry Send_Message    (Message :     Messages_Client);
      entry Receive_Message (Message : out Messages_Mailbox);

      entry Shutdown;

      -- Leave anything above this line as it will be used by the testing framework
      -- to communicate with your router.

      --  Add one or multiple further entries for inter-router communications here

      -- Distance Vector Message -> update the routing table, search the network topology
      entry Distance_Vector_Message (Message : Messages_Routing_Table);
      -- Entry used for forwarding message
      entry Forward_Message         (Message : out Messages_Forward);
      -- Entry used for notify neighbors when it's powered down
      entry Power_Down_Message      (Message : Messages_Power_Down);

   end Router_Task;

end Generic_Router;
