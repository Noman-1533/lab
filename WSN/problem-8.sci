// Trilateration simulation 
clear; 
clc; 
// Define positions of three anchor nodes (x, y) 
x1 = 0; y1 = 0; // Node 1 
x2 = 5; y2 = 5; // Node 2 
x3 = 2.5; y3 = 4.33; // Node 3 
// Known distances from the target node (in meters) 
d1 = 3; 
d2 = 4; 
d3 = 5; 
// Calculate the position of the target node using trilateration 
A = 2*x2 - 2*x1; 
B = 2*y2 - 2*y1; 
C = d1^2 - d2^2 - x1^2 + x2^2 - y1^2 + y2^2; 
D = 2*x3 - 2*x2; 
E = 2*y3 - 2*y2; 
F = d2^2 - d3^2 - x2^2 + x3^2 - y2^2 + y3^2; 
// Solve the system of equations 
x = (C - E*F/B) / (A - D*E/B); 
y = (C - A*x) / B; 
// Display the estimated position 
disp('Estimated position of the node:'); 
disp(['x = ', string(x), ' meters']); 
disp(['y = ', string(y), ' meters']);
