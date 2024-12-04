// WSN Lifetime Simulation 
clear; 
clc; 
// Number of nodes in the WSN 
num_nodes = 10; 
// Initial energy of each node (in units) 
initial_energy = 100; 
// Energy consumption per message transmission (in units) 
energy_per_message = 0.5; 
// Initialize the energy of each node 
node_energy = ones(1, num_nodes) * initial_energy; 
// Initialize the round counter 
round = 0; 
// Simulate the lifetime of the network 
while min(node_energy) > 0 
// Increment the round counter 
round = round + 1; 
// Each node consumes energy for transmission 
node_energy = node_energy - energy_per_message; 
// Display the remaining energy after each round 
disp(['Round ', string(round), ' energy of nodes:']); 
disp(node_energy); 
// If all nodes' energy is depleted, exit the loop 
if min(node_energy) <= 0 
break; 
end 
end 
// Display the final round and remaining energy 
disp(['Network lifetime: ', string(round), ' rounds']); 
disp('Remaining energy of the nodes:'); 
disp(node_energy);
