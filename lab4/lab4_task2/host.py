import intel_jtag_uart
import sys
import time
import matplotlib.pyplot as plt
import numpy as np
from collections import deque

NIOS_CMD_SHELL_BAT = "C:/intelFPGA_lite/18.1/nios2eds/Nios II Command Shell.bat"
BUFFER_SIZE = 1000  # Set rolling buffer size

def read_jtag():
    try:
        ju = intel_jtag_uart.intel_jtag_uart()
    except Exception as e:
        print(e)
        sys.exit(1)

    print("Listening for incoming JTAG UART data... (Press Ctrl+C to stop)")

    # Rolling buffers for storing the data
    data_buffer_1 = deque(maxlen=BUFFER_SIZE)
    data_buffer_2 = deque(maxlen=BUFFER_SIZE)
    data_buffer_3 = deque(maxlen=BUFFER_SIZE)

    # Set up the figure with three subplots
    fig, axes = plt.subplots(3, 1, figsize=(8, 10))
    fig.suptitle('Accelerometer Data (Three Channels)')

    labels = ['X_Value', 'Y_Value', 'Z_Value']
    lines = []

    for i, ax in enumerate(axes):
        ax.set_xlabel('Sample Index')
        ax.set_ylabel(labels[i])
        ax.set_ylim(-300, 300)  # Adjust as needed
        line, = ax.plot([], [], label=labels[i])
        ax.legend()
        lines.append(line)

    # Initialize text annotations once outside the loop
    text_annotations = [ax.text(0.8, 0.9, "", transform=ax.transAxes, fontsize=12) for ax in axes]

    # Initialize the impulse annotation (for impulse detection text)
    impulse_annotation = axes[2].annotate(
        "", xy=(0.5, 0.95), xycoords="axes fraction", ha="center", va="center", fontsize=14, color="red", fontweight="bold"
    )

    plt.ion()
    plt.show()

    line_buffer = ""  # Buffer for handling partial reads

    while True:
        data = ju.read()
        if data:
            decoded_data = data.decode(errors="ignore")
            line_buffer += decoded_data

            while "\n" in line_buffer:
                line_str, line_buffer = line_buffer.split("\n", 1)
                line_str = line_str.strip()

                if line_str:
                    try:
                        values = line_str.split()
                        if len(values) != 3:
                            print(f"Invalid data format: {line_str}")
                            continue

                        signed_ints = []
                        for value in values:
                            signed_int = int(value, 16)
                            if signed_int > 0x7FFFFFFF:
                                signed_int -= 0x100000000
                            signed_ints.append(signed_int)

                        # Add the new data to the rolling buffers
                        data_buffer_1.append(signed_ints[0])
                        data_buffer_2.append(signed_ints[1])
                        data_buffer_3.append(signed_ints[2])

                        # Impulse detection logic
                        window_size = 5
                        threshold = 10

                        if len(data_buffer_3) >= window_size:  # Ensure enough data
                            window = list(data_buffer_3)[-window_size:]  # Convert deque to list for slicing
                            avg = sum(window) / len(window)

                            if abs(signed_ints[2] - avg) > threshold:
                                impulse_annotation.set_text("Impulse Detected!")  # Show text on the plot

                            else:
                                impulse_annotation.set_text("")  # Clear text when no impulse detected

                        # Update text annotations with the latest values
                        for i, buffer in enumerate([data_buffer_1, data_buffer_2, data_buffer_3]):
                            if buffer:
                                text_annotations[i].set_text(f"{labels[i]}: {buffer[-1]}")

                    except ValueError:
                        print(f"Invalid data received (not hex?): {line_str}")
                        continue  # Skip this iteration

            # Update plots with rolling buffer data
            for i, (buffer, line) in enumerate(zip([data_buffer_1, data_buffer_2, data_buffer_3], lines)):
                line.set_xdata(np.arange(len(buffer)))
                line.set_ydata(list(buffer))
                axes[i].relim()
                axes[i].autoscale_view(True, True, True)

            plt.pause(0.05)
        time.sleep(0.1)

def main():
    read_jtag()

if __name__ == "__main__":
    main()
