	nios_accelerometer u0 (
		.clk_clk                                            (MAX10_CLK1_50),                                            //                                  clk.clk
		.reset_reset_n                                      (1'b1),                                      //                                reset.reset_n
		.led_external_connection_export                     (LEDR[9:0]),                     //              led_external_connection.export
		.accelerometer_spi_external_interface_I2C_SDAT      (GSENSOR_SDI),      // accelerometer_spi_external_interface.I2C_SDAT
		.accelerometer_spi_external_interface_I2C_SCLK      (GSENSOR_SCLK),      //                                     .I2C_SCLK
		.accelerometer_spi_external_interface_G_SENSOR_CS_N (GSENSOR_CS_N), //                                     .G_SENSOR_CS_N
		.accelerometer_spi_external_interface_G_SENSOR_INT  (GSENSOR_INT[1])   //                                     .G_SENSOR_INT
	);