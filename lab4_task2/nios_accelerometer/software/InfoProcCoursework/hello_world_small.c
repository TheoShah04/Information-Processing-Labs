#include "system.h"
#include "altera_up_avalon_accelerometer_spi.h"
#include "altera_avalon_timer_regs.h"
#include "altera_avalon_timer.h"
#include "altera_avalon_pio_regs.h"
#include "sys/alt_irq.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#define CHARLIM 256    // Maximum character length of what the user places in memory.  Increase to allow longer sequences
#define QUITLETTER '~' // Letter to kill all processing
#define OFFSET -32
#define PWM_PERIOD 16

alt_8 pwm = 0;
alt_u8 led;
int level;

void led_write(alt_u8 led_pattern) {
    IOWR(LED_BASE, 0, led_pattern);
}

char generate_text(char curr, int *length, char *text, int *running)
{
    if (curr == '\n')
        return curr; // If the line is empty, return nothing.
    int idx = 0;     // Keep track of how many characters have been sent down for later printing
    char newCurr = curr;

    while (newCurr != EOF && newCurr != '\n')
    { // Keep reading characters until we get to the end of the line
        if (newCurr == QUITLETTER)
        {
            *running = 0;
        }                        // If quitting letter is encountered, setting running to 0
        text[idx] = newCurr;     // Add the next letter to the text buffer
        idx++;                   // Keep track of the number of characters read
        newCurr = alt_getchar(); // Get the next character
    }
    *length = idx;

    return newCurr;
}

void read_chars() {
    char text[CHARLIM];  // Buffer for received text
    int running = 1;

    while (running) {
        int idx = 0;
        char curr;

        // Read a full line
        do {
            curr = alt_getchar();  // Read one character at a time
            if (curr == QUITLETTER) {
                running = 0;
                break;
            }
            if (curr != '\n' && idx < CHARLIM - 1) {
                text[idx++] = curr;
            }
        } while (curr != '\n');  // Stop when newline is received

        text[idx] = '\0';  // Ensure null termination

        if (strcmp(text, "ID") == 0) {
            led_write(0xFF);
        } else {
            led_write(0x00);
        }
    }
}

int main() {

    alt_32 x_read;
    alt_32 y_read;
    alt_32 z_read;
    alt_up_accelerometer_spi_dev * acc_dev;
    acc_dev = alt_up_accelerometer_spi_open_dev("/dev/accelerometer_spi");
    if (acc_dev == NULL) { // if return 1, check if the spi ip name is "accelerometer_spi"
        return 1;
    }

    while (1) {
        alt_up_accelerometer_spi_read_x_axis(acc_dev, & x_read);
        alt_up_accelerometer_spi_read_y_axis(acc_dev, & y_read);
        alt_up_accelerometer_spi_read_z_axis(acc_dev, & z_read);
        alt_printf("%x %x %x\n", x_read, y_read, z_read);
    }

    return 0;
}
