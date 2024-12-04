// Data-Centric Routing Protocol Simulation for WSN 
clear; 
clc; 
// Number of nodes in the WSN 
num_nodes = 10; 
// Base station coordinates (50, 50) 
base_station = [50, 50]; 
// Generate random data values for each node (between 0 and 100) 
node_data = 100 * rand(1, num_nodes); // Random data between 0 and 100 
// Energy consumption parameters 
energy_per_transmission = 0.5; // Energy consumed per transmission (in arbitrary units) 
// Initialize the total energy consumed 
total_energy_consumed = 0; 
// Display data values of the nodes 
disp('Data values from each node:'); 
disp(node_data); 
// Loop through each node to check if it transmits data 
for i = 1:num_nodes 
// If the node's data value exceeds the threshold (50), it transmits data 
if node_data(i) > 50 
// Calculate energy consumption for transmission 
total_energy_consumed = total_energy_consumed + energy_per_transmission; 
// Display the node's index and energy consumption 
disp(['Node ', string(i), ' transmits data.']); 
disp(['Energy consumed by node ', string(i), ': ', string(energy_per_transmission), ' units']); 
else 
disp(['Node ', string(i), ' does not transmit data.']); 
end 
end 
// Display the total energy consumed by all transmitting nodes 
disp(['Total energy consumed by transmitting nodes: ', string(total_energy_consumed), ' units']);
