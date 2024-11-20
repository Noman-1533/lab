
clc;
clear;
// Parameters for mmWave communication
frequency = 28e9; // 28 GHz (mmWave frequency)
c = 3e8; // Speed of light (m/s)
wavelength = c / frequency; // Wavelength
N = 8; // Number of antenna elements in the array
d = wavelength / 2; // Distance between antenna elements (half-wavelength)

theta_angles = -90:1:90; // Beamforming angles from -90 to 90 degrees

// Array response vector calculation
function h = array_response_vector(theta)
    k = 2 * %pi / wavelength; // Wave number
    h = exp(%i * k * d * (0:N-1) * sin(theta * %pi / 180)); // Ensure consistent dimensions
endfunction

// Simulate analog and digital beamforming
beamforming_gain_analog = zeros(1, length(theta_angles));
beamforming_gain_digital = zeros(1, length(theta_angles));

// Desired beamforming angle (e.g., 30 degrees)
desired_angle = 30;
w_desired = array_response_vector(desired_angle)'; // Desired steering vector (column vector)

// Loop over beamforming angles to compute gain
for idx = 1:length(theta_angles)
    theta = theta_angles(idx);
    h_theta = array_response_vector(theta)'; // Array response at angle theta (column vector)

    // Analog beamforming (using the same weights for all elements)
    w_analog = ones(N, 1) / sqrt(N); // Uniform weights (column vector)
    beamforming_gain_analog(idx) = abs(w_analog' * h_theta)^2;

    // Digital beamforming (using optimal weights for desired angle)
    w_digital = w_desired / norm(w_desired); // Normalize desired weights (column vector)
    beamforming_gain_digital(idx) = abs(w_digital' * h_theta)^2;
end

// Normalize the gains
beamforming_gain_analog = 10 * log10(beamforming_gain_analog / max(beamforming_gain_analog));
beamforming_gain_digital = 10 * log10(beamforming_gain_digital / max(beamforming_gain_digital));

// Plot the beamforming gains
clf; // Clear previous figure
plot(theta_angles, beamforming_gain_analog, '-r', 'LineWidth', 2); // Plot analog beamforming
plot(theta_angles, beamforming_gain_digital, '-b', 'LineWidth', 2); // Plot digital beamforming
xlabel('Beamforming Angle (degrees)');
ylabel('Beamforming Gain (dB)');
title('Beamforming Gain for Analog and Digital Beamforming');
legend('Analog Beamforming', 'Digital Beamforming', 'location', 'best');

// Enable gridlines
gca().grid = [1 1]; // Enable gridlines for both x and y axes

// Analysis of LOS and NLOS Scenarios
// For LOS, use direct array response
LOS_gain = abs(w_digital' * w_desired)^2;

// For NLOS, introduce a random phase shift
random_phase_shift = exp(%i * 2 * %pi * rand(1, N));
h_NLOS = w_desired .* random_phase_shift'; // Simulate NLOS response (element-wise multiplication)
NLOS_gain = abs(w_digital' * h_NLOS)^2;

disp("LOS Gain: " + string(10 * log10(LOS_gain)));
disp("NLOS Gain: " + string(10 * log10(NLOS_gain)));

// Disable gridlines (optional, if required later)
gca().grid = [0 0];
