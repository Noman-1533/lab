// OFDM Simulation in Sci-Lab

// Define parameters
N = 64; // Number of subcarriers
CP_length = 16; // Length of Cyclic Prefix
M = 2; // Modulation order (BPSK)
num_symbols = 1000; // Number of OFDM symbols
SNR_dB = 0:5:30; // SNR range in dB

// Generate random bit sequence
bits = round(rand(1, N * num_symbols));

// BPSK modulation
symbols = 2 * bits - 1; // BPSK mapping

// Reshape symbols into OFDM frames
ofdm_symbols = matrix(symbols, N, num_symbols);

// Perform IFFT to convert to time domain
ofdm_time = ifft(ofdm_symbols); // Perform IFFT

// Add Cyclic Prefix
ofdm_with_cp = [ofdm_time($-CP_length+1:$, :); ofdm_time];

// Function to add AWGN
function y = awgn_channel(signal, SNR)
    [rows, cols] = size(signal); // Get dimensions of the signal
    noise_power = 10^(-SNR / 10); // Noise power
    noise = sqrt(noise_power / 2) * (rand(rows, cols, "normal") + %i * rand(rows, cols, "normal"));
    y = signal + noise; // Add noise
    disp('noise power ',noise_power); // Display noise power for debugging
endfunction

// Function to model Rayleigh fading channel
function h = rayleigh_channel(N, CP_length, num_symbols)
    h = sqrt(1/2) * (rand(N + CP_length, num_symbols, "normal") + %i * rand(N + CP_length, num_symbols, "normal"));
endfunction

// BER calculation function
function [ber_awgn, ber_rayleigh] = calculate_ber(SNR_dB, ofdm_with_cp, bits, N, CP_length, num_symbols)
    ber_awgn = zeros(1, length(SNR_dB));
    ber_rayleigh = zeros(1, length(SNR_dB));

    for i = 1:length(SNR_dB)
        // Transmit over AWGN channel
        received_awgn = awgn_channel(ofdm_with_cp, SNR_dB(i));

        // Transmit over Rayleigh fading channel
        h = rayleigh_channel(N, CP_length, num_symbols);
        received_rayleigh = h .* ofdm_with_cp;

        // Remove Cyclic Prefix
        received_awgn_no_cp = received_awgn(CP_length+1:$, :);
        received_rayleigh_no_cp = received_rayleigh(CP_length+1:$, :);

        // Perform FFT to go back to frequency domain
        received_awgn_symbols = fft(received_awgn_no_cp, 1); // Perform FFT
        received_rayleigh_symbols = fft(received_rayleigh_no_cp, 1) / h;

        // Demodulate
       received_awgn_bits = (real(received_awgn_symbols) > 0) .* 1 + (real(received_awgn_symbols) <= 0) .* 0;
received_rayleigh_bits = (real(received_rayleigh_symbols) > 0) .* 1 + (real(received_rayleigh_symbols) <= 0) .* 0;

        // Calculate BER
        ber_awgn(i) = sum(bits <> received_awgn_bits) / length(bits);
        ber_rayleigh(i) = sum(bits <> received_rayleigh_bits) / length(bits);
    end
endfunction

// Calculate BER for different SNR values
[ber_awgn, ber_rayleigh] = calculate_ber(SNR_dB, ofdm_with_cp, bits, N, CP_length, num_symbols);
disp('ber_awgn',ber_awgn)
disp('ber_rayleigh',ber_rayleigh)
// Plot results
clf;
plot(SNR_dB, ber_awgn, '-o');
plot(SNR_dB, ber_rayleigh, '-x');
xlabel("SNR (dB)");
ylabel("Bit Error Rate (BER)");



title("OFDM Performance in AWGN and Rayleigh Fading Channels");
legend(["AWGN", "Rayleigh Fading"]);
