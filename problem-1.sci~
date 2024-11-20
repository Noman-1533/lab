// Simulation of Massive MIMO in 5G Networks
clc;
clear;
close;

// Parameters
N_antennas = [8, 16, 64]; // Number of antennas
SNR_dB = 0:5:30; // SNR in dB
SNR = 10 .^ (SNR_dB ./ 10); // Convert SNR to linear scale
Bandwidth = 20e6; // Bandwidth in Hz (20 MHz)
Channel_capacity = zeros(length(N_antennas), length(SNR_dB)); // Placeholder for results

// Compute channel capacity for varying numbers of antennas and SNR
for i = 1:length(N_antennas)
    M = N_antennas(i); // Number of antennas
    for j = 1:length(SNR)
        // Using Shannon's formula for capacity with massive MIMO enhancement
        Channel_capacity(i, j) = Bandwidth * log2(1 + M * SNR(j)); // Channel capacity in bps
    end
end

// Plot results
clf(); // Clear the figure
plot(SNR_dB, Channel_capacity(1, :) / 1e6, '-o', "LineWidth", 2); // Convert capacity to Mbps
legend_entries = ["M = " + string(N_antennas(1))];
for i = 2:length(N_antennas)
    plot(SNR_dB, Channel_capacity(i, :) / 1e6, '-o', "LineWidth", 2); // Add more curves
    legend_entries = [legend_entries; "M = " + string(N_antennas(i))];
end

title("Impact of Antennas and SNR on Channel Capacity in Massive MIMO");
xlabel("SNR (dB)");
ylabel("Channel Capacity (Mbps)");
legend(legend_entries, "location", "northwest");
xgrid(); // Add grid to x and y axes
//ygrid();
