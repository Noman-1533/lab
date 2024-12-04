// Energy Consumption Comparison for Direct vs. Indirect Transmission in WSN 
clear; 
clc; 
// Number of nodes in the network 
num_nodes = 10; 
// Base station coordinates (50, 50) 
base_station = [50, 50]; 
// Random node coordinates in the network (within a 100x100 area) 
node_positions = 100 * rand(2, num_nodes); // 2 rows (x, y) and num_nodes columns 
// Intermediate node coordinates (randomly selected within the network) 
intermediate_node_position = 100 * rand(1, 2); // 1 row for intermediate node 
// Function to calculate the Euclidean distance between two points 
function dist=calculate_distance(p1, p2) 
dist = sqrt((p1(1) - p2(1))^2 + (p1(2) - p2(2))^2); 
endfunction 
// Energy consumption arrays for direct and indirect transmission 
direct_energy = zeros(1, num_nodes); // Energy for direct transmission 
indirect_energy = zeros(1, num_nodes); // Energy for indirect transmission 
// Loop through each node to calculate the energy consumption for both methods 
for i = 1:num_nodes 
node_position = node_positions(:, i); 
// Direct transmission energy (node -> base station) 
direct_distance = calculate_distance(node_position, base_station); 
direct_energy(i) = direct_distance^2; // Energy proportional to distance squared 
// Indirect transmission energy (node -> intermediate node -> base station) 
node_to_intermediate = calculate_distance(node_position, intermediate_node_position); 
intermediate_to_base = calculate_distance(intermediate_node_position, base_station); 
indirect_energy(i) = node_to_intermediate^2 + intermediate_to_base^2; // Energy for two hops 
// Display the energy consumption for each node 
disp(['Node ', string(i), ':']); 
disp([' Direct Transmission Energy: ', string(direct_energy(i)), ' units']); 
disp([' Indirect Transmission Energy: ', string(indirect_energy(i)), ' units']); 
end 
// Compare and display the total energy consumption for both methods 
total_direct_energy = sum(direct_energy); 
total_indirect_energy = sum(indirect_energy); 
disp(['Total Energy for Direct Transmission: ', string(total_direct_energy), ' units']); 
disp(['Total Energy for Indirect Transmission: ', string(total_indirect_energy), ' units']);
