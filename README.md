# Digital Signal Processing (DSP) - Digital to Analog Conversion (DAC)
By [Naimur Rahman](https://github.com/nayeem-rafi)

## [Click for Files](https://drive.google.com/drive/folders/16pRQ0oPXqY4fPDopgF0g5SUuCsrBDqoU?usp=drive_link)

## Introduction:
This MATLAB code demonstrates both **Analog-to-Digital Conversion (ADC)** and **Digital-to-Analog Conversion (DAC)**. The code showcases the complete process of converting a continuous sine wave into its digital binary format using sampling, quantization, and encoding, followed by the recovery of the original signal from its digital representation. These concepts are foundational in many real-world applications such as audio/video processing, data communication, and control systems.

## Objective:
The objective of this project is to:
1. Sample a continuous sine wave.
2. Quantize the sampled signal into discrete levels.
3. Encode the quantized values into a binary sequence.
4. Recover the original signal from the binary sequence using DAC.

## Analyzing the Input:
The input signal is a continuous sine wave characterized by:
- **Frequency (f)**: 20 Hz
- **Amplitude (A)**: 5
- **Phase**: 0

The sine wave is sampled for 3 cycles at a multiple of the Nyquist rate, which ensures sufficient samples for accurate signal reconstruction.

## Sampling and Quantization:
1. **Sampling**:  
   The continuous sine wave is sampled at discrete intervals according to:
   - **Nyquist rate** (FN): \(2 \times f = 40 \, Hz\)
   - **Sampling frequency** (Fs): \(8 \times FN = 320 \, Hz\)
   - **Sampling period** (Ts): \(1 / Fs\)
   
   The sampled points are plotted as discrete markers on the input sine wave.

2. **Quantization**:  
   A 5-bit quantizer is used to map the sampled signal into 32 discrete levels between -5 and 5. The quantized values are chosen as the closest available quantization level.

## Digital Encoding:
After quantization, each quantized value is converted to its binary representation using 5 bits. The binary sequence is then visualized as a digital signal waveform. For visual clarity, binary '0' is represented as -1 and binary '1' is represented as 1 in the plot.

## DAC (Digital to Analog Conversion):
Once the signal is converted into its binary format, it is then decoded and transformed back into its original analog form:
1. **Decoding**:  
   The binary-encoded signal is loaded and each 5-bit sequence is decoded to its corresponding quantized value.
   
2. **Signal Reconstruction**:  
   The reconstructed signal is obtained by converting the binary sequence back into the quantized signal values and plotting them as discrete points. This step simulates how the original signal can be recovered after transmission in a digital system.


<h1 align= "center">

**Analog Conversion**
</h1>
<p align="center">
<img src="https://github.com/user-attachments/assets/2a877745-c8a8-4f0f-8062-1c6c4efca31b", width="620">
</p>

## How to Run the Code:
1. Install MATLAB on your system.
2. Open the MATLAB editor and copy the provided code.
3. Load the pre-generated binary data (`xe.mat`) using the `load('xe.mat')` command to simulate decoding the received binary sequence.
4. Run the script directly in the MATLAB environment to see the results.
5. The code will generate four plots:
   - Continuous sine wave (input signal).
   - Sampled sine wave.
   - Digital binary sequence.
   - Recovered signal after DAC.

## Conclusion:
This MATLAB script effectively demonstrates the entire process of **Analog-to-Digital Conversion (ADC)** and **Digital-to-Analog Conversion (DAC)**. Starting with a continuous analog signal, it goes through sampling, quantization, and binary encoding, before finally recovering the signal through decoding. The visual representation of each step offers insight into how signals are processed and recovered in digital communication systems.

This foundational approach serves as a basic framework for more complex applications in digital signal processing, including data transmission, audio/video conversion, and communication protocols.

---

You can experiment with different values for the frequency, amplitude, and number of quantization bits to observe how they impact the digital signal and its reconstruction!
