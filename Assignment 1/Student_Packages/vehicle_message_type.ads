-- Suggestions for packages which might be useful:

with Ada.Real_Time;         use Ada.Real_Time;
with Swarm_Structures_Base; use Swarm_Structures_Base;

package Vehicle_Message_Type is

   -- Replace this record definition by what your vehicles need to communicate.

   type Inter_Vehicle_Messages is record
      ----------------------find globe------------------------
      is_find_globe      : Boolean;
      globe_discovered   : Energy_Globes (1 .. 100);
      globe_number       : Integer;
      update_time        : Ada.Real_Time.Time;

      -----------ask for latest globe information-------------
      is_ask_info    : Boolean;
      is_answer_info : Boolean;
   end record;

end Vehicle_Message_Type;
