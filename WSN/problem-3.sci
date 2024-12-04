// Basic Clustering Mechanism in WSN
clear;
clc;

// Number of nodes in the WSN
num_nodes = 10;

// Percentage of nodes selected as cluster heads
cluster_head_percentage = 0.2;

// Energy consumption parameters
energy_per_aggregation = 1; // Energy consumed per aggregation (cluster heads)
energy_per_transmission = 0.5; // Energy consumed per transmission (non-cluster heads)

// Initialize the total energy consumed
total_energy_consumed = 0;

// Randomly select cluster heads
num_cluster_heads = round(cluster_head_percentage * num_nodes);

// Create a binary vector to represent cluster heads (1 = cluster head, 0 = non-cluster head)
cluster_heads = zeros(1, num_nodes);

// Generate a random permutation of indices and select the first num_cluster_heads indices
random_indices = rand(1, num_nodes); // Generate random values between 0 and 1
[sorted_values, sorted_indices] = gsort(random_indices, "g", "i"); // Sort the random indices in ascending order
cluster_head_indices = sorted_indices(1:num_cluster_heads); // Select the first num_cluster_heads indices

// Set these indices to 1 (cluster heads)
cluster_heads(cluster_head_indices) = 1;

// Display the selected cluster heads
disp('Selected Cluster Heads (1 = Cluster Head, 0 = Non-Cluster Head):');
disp(cluster_heads);

// Loop through each node to calculate energy consumption
for i = 1:num_nodes
    if cluster_heads(i) == 1
        // If the node is a cluster head, it aggregates data
        total_energy_consumed = total_energy_consumed + energy_per_aggregation;
        disp(['Node ', string(i), ' is a cluster head. Energy consumed: ', string(energy_per_aggregation), ' units (aggregation)']);
    else
        // If the node is not a cluster head, it sends data to the nearest cluster head
        total_energy_consumed = total_energy_consumed + energy_per_transmission;
        disp(['Node ', string(i), ' is not a cluster head. Energy consumed: ', string(energy_per_transmission), ' units (transmission)']);
    end
end

// Display the total energy consumed by all nodes
disp(['Total energy consumed by all nodes: ', string(total_energy_consumed), ' units']);
