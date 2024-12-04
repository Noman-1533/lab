// Energy Consumption Calculation for Direct Transmission in WSN 
clear; 
clc; 
// Number of nodes in the network 
num_nodes = 10; 
// Base station coordinates (50, 50) 
base_station = [50, 50]; 
// Random node coordinates in the network (within a 100x100 area) 
node_positions = 100 * rand(2, num_nodes); // 2 rows (x, y) and num_nodes columns 
// Function to calculate the Euclidean distance between two points 
function dist=calculate_distance(p1, p2) 
dist = sqrt((p1(1) - p2(1))^2 + (p1(2) - p2(2))^2); 
endfunction 
// Energy consumption array for direct transmission 
direct_energy = zeros(1, num_nodes); // Energy for direct transmission 
// Loop through each node to calculate the energy consumption for direct transmission 
for i = 1:num_nodes 
node_position = node_positions(:, i); 
// Direct transmission energy (node -> base station) 
direct_distance = calculate_distance(node_position, base_station); 
direct_energy(i) = direct_distance^2; // Energy proportional to distance squared 
// Display the energy consumption for each node 
disp(['Node ', string(i), ':']); 
disp([' Direct Transmission Energy: ', string(direct_energy(i)), ' units']); 
end 
// Compare and display the total energy consumption for direct transmission 
total_direct_energy = sum(direct_energy); 
disp(['Total Energy for Direct Transmission: ', string(total_direct_energy), ' units']); 
