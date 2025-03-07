nios_accelerometer u0 (
	.clk_clk                                            (MAX10_CLK1_50),     
	.reset_reset_n                                      (1'b1),                   
	.led_external_connection_export                     (LEDR[9:0]),
	.accelerometer_spi_external_interface_I2C_SDAT      (GSENSOR_SDI), 
	.accelerometer_spi_external_interface_I2C_SCLK      (GSENSOR_SCLK),        
	.accelerometer_spi_external_interface_G_SENSOR_CS_N (GSENSOR_CS_N),                     
	.accelerometer_spi_external_interface_G_SENSOR_INT  (GSENSOR_INT[1]),                           
	.hex5_external_connection_export                    (HEX5),               
	.hex4_external_connection_export                    (HEX4),
	.hex3_external_connection_export                    (HEX3),
	.hex2_external_connection_export                    (HEX2),
	.hex1_external_connection_export                    (HEX1),
	.hex0_external_connection_export                    (HEX0),
	.button_external_connection_export                  (keyMod[3:0]) 
);

