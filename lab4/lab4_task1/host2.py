import intel_jtag_uart
import sys

NIOS_CMD_SHELL_BAT = "C:/intelFPGA_lite/18.1/nios2eds/Nios II Command Shell.bat"

def send_on_jtag(cmd):
    # check if atleast one character is being sent down
    assert (len(cmd) >= 1), "Please make the cmd a single character"

    try:
        ju = intel_jtag_uart.intel_jtag_uart()

    except Exception as e:
        print(e)
        sys.exit(1)

    ju.write(cmd.encode())
    while True:
        data = ju.read()  # Try reading up to 1024 bytes
        if not data:
            break  # Stop reading if no data is available
        print("Received from JTAG UART:", data.decode(errors="ignore"), end="")
    

def perform_computation():
    send_on_jtag("testingHello123")

def main():
    perform_computation()


if __name__ == "__main__":
    main()
