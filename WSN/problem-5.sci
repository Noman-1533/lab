// WSN Data Aggregation Simulation 
clear; 
clc; 
// Number of nodes in the WSN 
num_nodes = 10; 
// Generate random data values for each node (between 0 and 100) 
node_data = 100 * rand(1, num_nodes); // Random data between 0 and 100 
// Display the data from each node 
disp('Data values from each node:'); 
disp(node_data); 
// Calculate the aggregated data value (average of all nodes' data) 
aggregated_data = mean(node_data); 
// Display the aggregated data value 
disp(['Aggregated data value (average): ', string(aggregated_data)]);
