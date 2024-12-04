// Signal strength vs. distance simulation 
clear; 
clc; 
// Define the parameters 
d = 1:1:100; // Distance from the transmitter (1 to 100 meters) 
P0 = 1; // Transmitter power (arbitrary unit) 
// Calculate the signal strength using the inverse-square law 
signal_strength = P0 ./ (d.^2); 
// Plot the results 
plot(d, signal_strength); 
xlabel('Distance (m)'); 
ylabel('Signal Strength'); 
title('Signal Strength vs. Distance'); 
//grid on;
