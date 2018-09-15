--
--  Framework: Uwe R. Zimmer, Australia, 2015
--

with Ada.Strings.Bounded;           use Ada.Strings.Bounded;
with Generic_Routers_Configuration;

generic
   with package Routers_Configuration is new Generic_Routers_Configuration (<>);

package Generic_Message_Structures is

   use Routers_Configuration;

   package Message_Strings is new Generic_Bounded_Length (Max => 80);
   use Message_Strings;

   subtype The_Core_Message is Bounded_String;

   type Messages_Client is record
      Destination : Router_Range;
      The_Message : The_Core_Message;
   end record;

   type Messages_Mailbox is record
      Sender      : Router_Range     := Router_Range'Invalid_Value;
      The_Message : The_Core_Message := Message_Strings.To_Bounded_String ("");
      Hop_Counter : Natural          := 0;
   end record;

   -- Leave anything above this line as it will be used by the testing framework
   -- to communicate with your router.

   --  Add one or multiple more messages formats here ..

   type Routing_Table_Element is record
      Next_Hop        : Router_Range := Router_Range'Invalid_Value;
      -- Natural'Invalid_Value is regarded as Infinite
      Distance        : Natural      := Natural'Invalid_Value;
      Is_Powered_Down : Boolean      := False;
   end record;

   --  Routing Table:
   --         1.Destination
   --         2.Shortest Distance
   --         3.Next Hop Router ID
   --         4.Whether Destination Router Is Shutdown
   type Routing_Table is array (Router_Range) of Routing_Table_Element;

   -- Distance Vector Message Type -> message for the routing table updating
   type Messages_Routing_Table is record
      Sender             : Router_Range     := Router_Range'Invalid_Value;
      This_Routing_Table : Routing_Table;
   end record;

   -- Forwarding Message Type -> message for the communications among routers
   type Messages_Forward is record
      Sender      : Router_Range     := Router_Range'Invalid_Value;
      Destination : Router_Range     := Router_Range'Invalid_Value;
      The_Message : The_Core_Message := Message_Strings.To_Bounded_String ("");
      Hop_Counter : Natural          := Natural'Invalid_Value;
   end record;

   -- Shutdown Notification Message Type -> message to notify others that one is powered down
   type Messages_Power_Down is record
      Sender      : Router_Range     := Router_Range'Invalid_Value;
   end record;

end Generic_Message_Structures;
