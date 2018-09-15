with Swarm_Structures_Base;      use Swarm_Structures_Base;
with Real_Type;                  use Real_Type;
with Vehicle_Message_Type;       use Vehicle_Message_Type;

package vehicleFunction is
   shared_position : Positions;
   shared_velocity : Velocities;

   procedure showPosition (thisPosition : Positions);
   procedure showVelocity (thisVelocity : Velocities);
   procedure showAcceleration (thisAcceleration : Accelerations);
   procedure showCharge (charge : Vehicle_Charges);
   procedure set_shared_position (pos : Positions);
   procedure set_shared_velocity (vel : Velocities);
   procedure set_ask_info (Msg : in out Inter_Vehicle_Messages);
   procedure set_find_globe (Msg : in out Inter_Vehicle_Messages);
   procedure set_answer_info (Msg : in out Inter_Vehicle_Messages);
   procedure message_initialize (Msg : in out Inter_Vehicle_Messages);
   function get_shared_position return Positions;
   function get_shared_velocity return Velocities;
   function get_distance (Pos1, Pos2 : Positions) return Real;
   function get_closest_globe (Current_Position : Positions; Globes : Energy_Globes; Globes_number : Integer) return Integer;
end vehicleFunction;
