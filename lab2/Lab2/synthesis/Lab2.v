// Lab2.v

// Generated using ACDS version 18.1 625

`timescale 1 ps / 1 ps
module Lab2 (
		input  wire [3:0] button_external_connection_export, // button_external_connection.export
		input  wire       clk_clk,                           //                        clk.clk
		output wire [6:0] hex0_external_connection_export,   //   hex0_external_connection.export
		output wire [6:0] hex1_external_connection_export,   //   hex1_external_connection.export
		output wire [6:0] hex2_external_connection_export,   //   hex2_external_connection.export
		output wire [6:0] hex3_external_connection_export,   //   hex3_external_connection.export
		output wire [6:0] hex4_external_connection_export,   //   hex4_external_connection.export
		output wire [6:0] hex5_external_connection_export,   //   hex5_external_connection.export
		output wire [9:0] led_external_connection_export,    //    led_external_connection.export
		input  wire       reset_reset_n,                     //                      reset.reset_n
		input  wire [9:0] switch_external_connection_export  // switch_external_connection.export
	);

	wire  [31:0] cpu_data_master_readdata;                                  // mm_interconnect_0:cpu_data_master_readdata -> cpu:d_readdata
	wire         cpu_data_master_waitrequest;                               // mm_interconnect_0:cpu_data_master_waitrequest -> cpu:d_waitrequest
	wire         cpu_data_master_debugaccess;                               // cpu:debug_mem_slave_debugaccess_to_roms -> mm_interconnect_0:cpu_data_master_debugaccess
	wire  [17:0] cpu_data_master_address;                                   // cpu:d_address -> mm_interconnect_0:cpu_data_master_address
	wire   [3:0] cpu_data_master_byteenable;                                // cpu:d_byteenable -> mm_interconnect_0:cpu_data_master_byteenable
	wire         cpu_data_master_read;                                      // cpu:d_read -> mm_interconnect_0:cpu_data_master_read
	wire         cpu_data_master_write;                                     // cpu:d_write -> mm_interconnect_0:cpu_data_master_write
	wire  [31:0] cpu_data_master_writedata;                                 // cpu:d_writedata -> mm_interconnect_0:cpu_data_master_writedata
	wire  [31:0] cpu_instruction_master_readdata;                           // mm_interconnect_0:cpu_instruction_master_readdata -> cpu:i_readdata
	wire         cpu_instruction_master_waitrequest;                        // mm_interconnect_0:cpu_instruction_master_waitrequest -> cpu:i_waitrequest
	wire  [17:0] cpu_instruction_master_address;                            // cpu:i_address -> mm_interconnect_0:cpu_instruction_master_address
	wire         cpu_instruction_master_read;                               // cpu:i_read -> mm_interconnect_0:cpu_instruction_master_read
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect;  // mm_interconnect_0:jtag_uart_avalon_jtag_slave_chipselect -> jtag_uart:av_chipselect
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata;    // jtag_uart:av_readdata -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_readdata
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest; // jtag_uart:av_waitrequest -> mm_interconnect_0:jtag_uart_avalon_jtag_slave_waitrequest
	wire   [0:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_address;     // mm_interconnect_0:jtag_uart_avalon_jtag_slave_address -> jtag_uart:av_address
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_read;        // mm_interconnect_0:jtag_uart_avalon_jtag_slave_read -> jtag_uart:av_read_n
	wire         mm_interconnect_0_jtag_uart_avalon_jtag_slave_write;       // mm_interconnect_0:jtag_uart_avalon_jtag_slave_write -> jtag_uart:av_write_n
	wire  [31:0] mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata;   // mm_interconnect_0:jtag_uart_avalon_jtag_slave_writedata -> jtag_uart:av_writedata
	wire  [31:0] mm_interconnect_0_sysid_qsys_0_control_slave_readdata;     // sysid_qsys_0:readdata -> mm_interconnect_0:sysid_qsys_0_control_slave_readdata
	wire   [0:0] mm_interconnect_0_sysid_qsys_0_control_slave_address;      // mm_interconnect_0:sysid_qsys_0_control_slave_address -> sysid_qsys_0:address
	wire  [31:0] mm_interconnect_0_cpu_debug_mem_slave_readdata;            // cpu:debug_mem_slave_readdata -> mm_interconnect_0:cpu_debug_mem_slave_readdata
	wire         mm_interconnect_0_cpu_debug_mem_slave_waitrequest;         // cpu:debug_mem_slave_waitrequest -> mm_interconnect_0:cpu_debug_mem_slave_waitrequest
	wire         mm_interconnect_0_cpu_debug_mem_slave_debugaccess;         // mm_interconnect_0:cpu_debug_mem_slave_debugaccess -> cpu:debug_mem_slave_debugaccess
	wire   [8:0] mm_interconnect_0_cpu_debug_mem_slave_address;             // mm_interconnect_0:cpu_debug_mem_slave_address -> cpu:debug_mem_slave_address
	wire         mm_interconnect_0_cpu_debug_mem_slave_read;                // mm_interconnect_0:cpu_debug_mem_slave_read -> cpu:debug_mem_slave_read
	wire   [3:0] mm_interconnect_0_cpu_debug_mem_slave_byteenable;          // mm_interconnect_0:cpu_debug_mem_slave_byteenable -> cpu:debug_mem_slave_byteenable
	wire         mm_interconnect_0_cpu_debug_mem_slave_write;               // mm_interconnect_0:cpu_debug_mem_slave_write -> cpu:debug_mem_slave_write
	wire  [31:0] mm_interconnect_0_cpu_debug_mem_slave_writedata;           // mm_interconnect_0:cpu_debug_mem_slave_writedata -> cpu:debug_mem_slave_writedata
	wire         mm_interconnect_0_onchip_memory_s1_chipselect;             // mm_interconnect_0:onchip_memory_s1_chipselect -> onchip_memory:chipselect
	wire  [31:0] mm_interconnect_0_onchip_memory_s1_readdata;               // onchip_memory:readdata -> mm_interconnect_0:onchip_memory_s1_readdata
	wire  [13:0] mm_interconnect_0_onchip_memory_s1_address;                // mm_interconnect_0:onchip_memory_s1_address -> onchip_memory:address
	wire   [3:0] mm_interconnect_0_onchip_memory_s1_byteenable;             // mm_interconnect_0:onchip_memory_s1_byteenable -> onchip_memory:byteenable
	wire         mm_interconnect_0_onchip_memory_s1_write;                  // mm_interconnect_0:onchip_memory_s1_write -> onchip_memory:write
	wire  [31:0] mm_interconnect_0_onchip_memory_s1_writedata;              // mm_interconnect_0:onchip_memory_s1_writedata -> onchip_memory:writedata
	wire         mm_interconnect_0_onchip_memory_s1_clken;                  // mm_interconnect_0:onchip_memory_s1_clken -> onchip_memory:clken
	wire  [31:0] mm_interconnect_0_button_s1_readdata;                      // button:readdata -> mm_interconnect_0:button_s1_readdata
	wire   [1:0] mm_interconnect_0_button_s1_address;                       // mm_interconnect_0:button_s1_address -> button:address
	wire  [31:0] mm_interconnect_0_switch_s1_readdata;                      // switch:readdata -> mm_interconnect_0:switch_s1_readdata
	wire   [1:0] mm_interconnect_0_switch_s1_address;                       // mm_interconnect_0:switch_s1_address -> switch:address
	wire         mm_interconnect_0_led_s1_chipselect;                       // mm_interconnect_0:led_s1_chipselect -> led:chipselect
	wire  [31:0] mm_interconnect_0_led_s1_readdata;                         // led:readdata -> mm_interconnect_0:led_s1_readdata
	wire   [1:0] mm_interconnect_0_led_s1_address;                          // mm_interconnect_0:led_s1_address -> led:address
	wire         mm_interconnect_0_led_s1_write;                            // mm_interconnect_0:led_s1_write -> led:write_n
	wire  [31:0] mm_interconnect_0_led_s1_writedata;                        // mm_interconnect_0:led_s1_writedata -> led:writedata
	wire         mm_interconnect_0_hex0_s1_chipselect;                      // mm_interconnect_0:hex0_s1_chipselect -> hex0:chipselect
	wire  [31:0] mm_interconnect_0_hex0_s1_readdata;                        // hex0:readdata -> mm_interconnect_0:hex0_s1_readdata
	wire   [1:0] mm_interconnect_0_hex0_s1_address;                         // mm_interconnect_0:hex0_s1_address -> hex0:address
	wire         mm_interconnect_0_hex0_s1_write;                           // mm_interconnect_0:hex0_s1_write -> hex0:write_n
	wire  [31:0] mm_interconnect_0_hex0_s1_writedata;                       // mm_interconnect_0:hex0_s1_writedata -> hex0:writedata
	wire         mm_interconnect_0_hex2_s1_chipselect;                      // mm_interconnect_0:hex2_s1_chipselect -> hex2:chipselect
	wire  [31:0] mm_interconnect_0_hex2_s1_readdata;                        // hex2:readdata -> mm_interconnect_0:hex2_s1_readdata
	wire   [1:0] mm_interconnect_0_hex2_s1_address;                         // mm_interconnect_0:hex2_s1_address -> hex2:address
	wire         mm_interconnect_0_hex2_s1_write;                           // mm_interconnect_0:hex2_s1_write -> hex2:write_n
	wire  [31:0] mm_interconnect_0_hex2_s1_writedata;                       // mm_interconnect_0:hex2_s1_writedata -> hex2:writedata
	wire         mm_interconnect_0_hex3_s1_chipselect;                      // mm_interconnect_0:hex3_s1_chipselect -> hex3:chipselect
	wire  [31:0] mm_interconnect_0_hex3_s1_readdata;                        // hex3:readdata -> mm_interconnect_0:hex3_s1_readdata
	wire   [1:0] mm_interconnect_0_hex3_s1_address;                         // mm_interconnect_0:hex3_s1_address -> hex3:address
	wire         mm_interconnect_0_hex3_s1_write;                           // mm_interconnect_0:hex3_s1_write -> hex3:write_n
	wire  [31:0] mm_interconnect_0_hex3_s1_writedata;                       // mm_interconnect_0:hex3_s1_writedata -> hex3:writedata
	wire         mm_interconnect_0_hex4_s1_chipselect;                      // mm_interconnect_0:hex4_s1_chipselect -> hex4:chipselect
	wire  [31:0] mm_interconnect_0_hex4_s1_readdata;                        // hex4:readdata -> mm_interconnect_0:hex4_s1_readdata
	wire   [1:0] mm_interconnect_0_hex4_s1_address;                         // mm_interconnect_0:hex4_s1_address -> hex4:address
	wire         mm_interconnect_0_hex4_s1_write;                           // mm_interconnect_0:hex4_s1_write -> hex4:write_n
	wire  [31:0] mm_interconnect_0_hex4_s1_writedata;                       // mm_interconnect_0:hex4_s1_writedata -> hex4:writedata
	wire         mm_interconnect_0_hex5_s1_chipselect;                      // mm_interconnect_0:hex5_s1_chipselect -> hex5:chipselect
	wire  [31:0] mm_interconnect_0_hex5_s1_readdata;                        // hex5:readdata -> mm_interconnect_0:hex5_s1_readdata
	wire   [1:0] mm_interconnect_0_hex5_s1_address;                         // mm_interconnect_0:hex5_s1_address -> hex5:address
	wire         mm_interconnect_0_hex5_s1_write;                           // mm_interconnect_0:hex5_s1_write -> hex5:write_n
	wire  [31:0] mm_interconnect_0_hex5_s1_writedata;                       // mm_interconnect_0:hex5_s1_writedata -> hex5:writedata
	wire         mm_interconnect_0_hex1_s1_chipselect;                      // mm_interconnect_0:hex1_s1_chipselect -> hex1:chipselect
	wire  [31:0] mm_interconnect_0_hex1_s1_readdata;                        // hex1:readdata -> mm_interconnect_0:hex1_s1_readdata
	wire   [1:0] mm_interconnect_0_hex1_s1_address;                         // mm_interconnect_0:hex1_s1_address -> hex1:address
	wire         mm_interconnect_0_hex1_s1_write;                           // mm_interconnect_0:hex1_s1_write -> hex1:write_n
	wire  [31:0] mm_interconnect_0_hex1_s1_writedata;                       // mm_interconnect_0:hex1_s1_writedata -> hex1:writedata
	wire         irq_mapper_receiver0_irq;                                  // jtag_uart:av_irq -> irq_mapper:receiver0_irq
	wire  [31:0] cpu_irq_irq;                                               // irq_mapper:sender_irq -> cpu:irq
	wire         rst_controller_reset_out_reset;                            // rst_controller:reset_out -> [button:reset_n, cpu:reset_n, hex0:reset_n, hex1:reset_n, hex2:reset_n, hex3:reset_n, hex4:reset_n, hex5:reset_n, irq_mapper:reset, jtag_uart:rst_n, led:reset_n, mm_interconnect_0:cpu_reset_reset_bridge_in_reset_reset, onchip_memory:reset, rst_translator:in_reset, switch:reset_n, sysid_qsys_0:reset_n]
	wire         rst_controller_reset_out_reset_req;                        // rst_controller:reset_req -> [cpu:reset_req, onchip_memory:reset_req, rst_translator:reset_req_in]

	Lab2_button button (
		.clk      (clk_clk),                              //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address  (mm_interconnect_0_button_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_button_s1_readdata), //                    .readdata
		.in_port  (button_external_connection_export)     // external_connection.export
	);

	Lab2_cpu cpu (
		.clk                                 (clk_clk),                                           //                       clk.clk
		.reset_n                             (~rst_controller_reset_out_reset),                   //                     reset.reset_n
		.reset_req                           (rst_controller_reset_out_reset_req),                //                          .reset_req
		.d_address                           (cpu_data_master_address),                           //               data_master.address
		.d_byteenable                        (cpu_data_master_byteenable),                        //                          .byteenable
		.d_read                              (cpu_data_master_read),                              //                          .read
		.d_readdata                          (cpu_data_master_readdata),                          //                          .readdata
		.d_waitrequest                       (cpu_data_master_waitrequest),                       //                          .waitrequest
		.d_write                             (cpu_data_master_write),                             //                          .write
		.d_writedata                         (cpu_data_master_writedata),                         //                          .writedata
		.debug_mem_slave_debugaccess_to_roms (cpu_data_master_debugaccess),                       //                          .debugaccess
		.i_address                           (cpu_instruction_master_address),                    //        instruction_master.address
		.i_read                              (cpu_instruction_master_read),                       //                          .read
		.i_readdata                          (cpu_instruction_master_readdata),                   //                          .readdata
		.i_waitrequest                       (cpu_instruction_master_waitrequest),                //                          .waitrequest
		.irq                                 (cpu_irq_irq),                                       //                       irq.irq
		.debug_reset_request                 (),                                                  //       debug_reset_request.reset
		.debug_mem_slave_address             (mm_interconnect_0_cpu_debug_mem_slave_address),     //           debug_mem_slave.address
		.debug_mem_slave_byteenable          (mm_interconnect_0_cpu_debug_mem_slave_byteenable),  //                          .byteenable
		.debug_mem_slave_debugaccess         (mm_interconnect_0_cpu_debug_mem_slave_debugaccess), //                          .debugaccess
		.debug_mem_slave_read                (mm_interconnect_0_cpu_debug_mem_slave_read),        //                          .read
		.debug_mem_slave_readdata            (mm_interconnect_0_cpu_debug_mem_slave_readdata),    //                          .readdata
		.debug_mem_slave_waitrequest         (mm_interconnect_0_cpu_debug_mem_slave_waitrequest), //                          .waitrequest
		.debug_mem_slave_write               (mm_interconnect_0_cpu_debug_mem_slave_write),       //                          .write
		.debug_mem_slave_writedata           (mm_interconnect_0_cpu_debug_mem_slave_writedata),   //                          .writedata
		.dummy_ci_port                       ()                                                   // custom_instruction_master.readra
	);

	Lab2_hex0 hex0 (
		.clk        (clk_clk),                              //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address    (mm_interconnect_0_hex0_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_hex0_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_hex0_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_hex0_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_hex0_s1_readdata),   //                    .readdata
		.out_port   (hex0_external_connection_export)       // external_connection.export
	);

	Lab2_hex0 hex1 (
		.clk        (clk_clk),                              //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address    (mm_interconnect_0_hex1_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_hex1_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_hex1_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_hex1_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_hex1_s1_readdata),   //                    .readdata
		.out_port   (hex1_external_connection_export)       // external_connection.export
	);

	Lab2_hex0 hex2 (
		.clk        (clk_clk),                              //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address    (mm_interconnect_0_hex2_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_hex2_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_hex2_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_hex2_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_hex2_s1_readdata),   //                    .readdata
		.out_port   (hex2_external_connection_export)       // external_connection.export
	);

	Lab2_hex0 hex3 (
		.clk        (clk_clk),                              //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address    (mm_interconnect_0_hex3_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_hex3_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_hex3_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_hex3_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_hex3_s1_readdata),   //                    .readdata
		.out_port   (hex3_external_connection_export)       // external_connection.export
	);

	Lab2_hex0 hex4 (
		.clk        (clk_clk),                              //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address    (mm_interconnect_0_hex4_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_hex4_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_hex4_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_hex4_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_hex4_s1_readdata),   //                    .readdata
		.out_port   (hex4_external_connection_export)       // external_connection.export
	);

	Lab2_hex0 hex5 (
		.clk        (clk_clk),                              //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address    (mm_interconnect_0_hex5_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_hex5_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_hex5_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_hex5_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_hex5_s1_readdata),   //                    .readdata
		.out_port   (hex5_external_connection_export)       // external_connection.export
	);

	Lab2_jtag_uart jtag_uart (
		.clk            (clk_clk),                                                   //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                           //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver0_irq)                                   //               irq.irq
	);

	Lab2_led led (
		.clk        (clk_clk),                             //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),     //               reset.reset_n
		.address    (mm_interconnect_0_led_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_led_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_led_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_led_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_led_s1_readdata),   //                    .readdata
		.out_port   (led_external_connection_export)       // external_connection.export
	);

	Lab2_onchip_memory onchip_memory (
		.clk        (clk_clk),                                       //   clk1.clk
		.address    (mm_interconnect_0_onchip_memory_s1_address),    //     s1.address
		.clken      (mm_interconnect_0_onchip_memory_s1_clken),      //       .clken
		.chipselect (mm_interconnect_0_onchip_memory_s1_chipselect), //       .chipselect
		.write      (mm_interconnect_0_onchip_memory_s1_write),      //       .write
		.readdata   (mm_interconnect_0_onchip_memory_s1_readdata),   //       .readdata
		.writedata  (mm_interconnect_0_onchip_memory_s1_writedata),  //       .writedata
		.byteenable (mm_interconnect_0_onchip_memory_s1_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset),                // reset1.reset
		.reset_req  (rst_controller_reset_out_reset_req),            //       .reset_req
		.freeze     (1'b0)                                           // (terminated)
	);

	Lab2_switch switch (
		.clk      (clk_clk),                              //                 clk.clk
		.reset_n  (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address  (mm_interconnect_0_switch_s1_address),  //                  s1.address
		.readdata (mm_interconnect_0_switch_s1_readdata), //                    .readdata
		.in_port  (switch_external_connection_export)     // external_connection.export
	);

	Lab2_sysid_qsys_0 sysid_qsys_0 (
		.clock    (clk_clk),                                               //           clk.clk
		.reset_n  (~rst_controller_reset_out_reset),                       //         reset.reset_n
		.readdata (mm_interconnect_0_sysid_qsys_0_control_slave_readdata), // control_slave.readdata
		.address  (mm_interconnect_0_sysid_qsys_0_control_slave_address)   //              .address
	);

	Lab2_mm_interconnect_0 mm_interconnect_0 (
		.clk_clk_clk                             (clk_clk),                                                   //                         clk_clk.clk
		.cpu_reset_reset_bridge_in_reset_reset   (rst_controller_reset_out_reset),                            // cpu_reset_reset_bridge_in_reset.reset
		.cpu_data_master_address                 (cpu_data_master_address),                                   //                 cpu_data_master.address
		.cpu_data_master_waitrequest             (cpu_data_master_waitrequest),                               //                                .waitrequest
		.cpu_data_master_byteenable              (cpu_data_master_byteenable),                                //                                .byteenable
		.cpu_data_master_read                    (cpu_data_master_read),                                      //                                .read
		.cpu_data_master_readdata                (cpu_data_master_readdata),                                  //                                .readdata
		.cpu_data_master_write                   (cpu_data_master_write),                                     //                                .write
		.cpu_data_master_writedata               (cpu_data_master_writedata),                                 //                                .writedata
		.cpu_data_master_debugaccess             (cpu_data_master_debugaccess),                               //                                .debugaccess
		.cpu_instruction_master_address          (cpu_instruction_master_address),                            //          cpu_instruction_master.address
		.cpu_instruction_master_waitrequest      (cpu_instruction_master_waitrequest),                        //                                .waitrequest
		.cpu_instruction_master_read             (cpu_instruction_master_read),                               //                                .read
		.cpu_instruction_master_readdata         (cpu_instruction_master_readdata),                           //                                .readdata
		.button_s1_address                       (mm_interconnect_0_button_s1_address),                       //                       button_s1.address
		.button_s1_readdata                      (mm_interconnect_0_button_s1_readdata),                      //                                .readdata
		.cpu_debug_mem_slave_address             (mm_interconnect_0_cpu_debug_mem_slave_address),             //             cpu_debug_mem_slave.address
		.cpu_debug_mem_slave_write               (mm_interconnect_0_cpu_debug_mem_slave_write),               //                                .write
		.cpu_debug_mem_slave_read                (mm_interconnect_0_cpu_debug_mem_slave_read),                //                                .read
		.cpu_debug_mem_slave_readdata            (mm_interconnect_0_cpu_debug_mem_slave_readdata),            //                                .readdata
		.cpu_debug_mem_slave_writedata           (mm_interconnect_0_cpu_debug_mem_slave_writedata),           //                                .writedata
		.cpu_debug_mem_slave_byteenable          (mm_interconnect_0_cpu_debug_mem_slave_byteenable),          //                                .byteenable
		.cpu_debug_mem_slave_waitrequest         (mm_interconnect_0_cpu_debug_mem_slave_waitrequest),         //                                .waitrequest
		.cpu_debug_mem_slave_debugaccess         (mm_interconnect_0_cpu_debug_mem_slave_debugaccess),         //                                .debugaccess
		.hex0_s1_address                         (mm_interconnect_0_hex0_s1_address),                         //                         hex0_s1.address
		.hex0_s1_write                           (mm_interconnect_0_hex0_s1_write),                           //                                .write
		.hex0_s1_readdata                        (mm_interconnect_0_hex0_s1_readdata),                        //                                .readdata
		.hex0_s1_writedata                       (mm_interconnect_0_hex0_s1_writedata),                       //                                .writedata
		.hex0_s1_chipselect                      (mm_interconnect_0_hex0_s1_chipselect),                      //                                .chipselect
		.hex1_s1_address                         (mm_interconnect_0_hex1_s1_address),                         //                         hex1_s1.address
		.hex1_s1_write                           (mm_interconnect_0_hex1_s1_write),                           //                                .write
		.hex1_s1_readdata                        (mm_interconnect_0_hex1_s1_readdata),                        //                                .readdata
		.hex1_s1_writedata                       (mm_interconnect_0_hex1_s1_writedata),                       //                                .writedata
		.hex1_s1_chipselect                      (mm_interconnect_0_hex1_s1_chipselect),                      //                                .chipselect
		.hex2_s1_address                         (mm_interconnect_0_hex2_s1_address),                         //                         hex2_s1.address
		.hex2_s1_write                           (mm_interconnect_0_hex2_s1_write),                           //                                .write
		.hex2_s1_readdata                        (mm_interconnect_0_hex2_s1_readdata),                        //                                .readdata
		.hex2_s1_writedata                       (mm_interconnect_0_hex2_s1_writedata),                       //                                .writedata
		.hex2_s1_chipselect                      (mm_interconnect_0_hex2_s1_chipselect),                      //                                .chipselect
		.hex3_s1_address                         (mm_interconnect_0_hex3_s1_address),                         //                         hex3_s1.address
		.hex3_s1_write                           (mm_interconnect_0_hex3_s1_write),                           //                                .write
		.hex3_s1_readdata                        (mm_interconnect_0_hex3_s1_readdata),                        //                                .readdata
		.hex3_s1_writedata                       (mm_interconnect_0_hex3_s1_writedata),                       //                                .writedata
		.hex3_s1_chipselect                      (mm_interconnect_0_hex3_s1_chipselect),                      //                                .chipselect
		.hex4_s1_address                         (mm_interconnect_0_hex4_s1_address),                         //                         hex4_s1.address
		.hex4_s1_write                           (mm_interconnect_0_hex4_s1_write),                           //                                .write
		.hex4_s1_readdata                        (mm_interconnect_0_hex4_s1_readdata),                        //                                .readdata
		.hex4_s1_writedata                       (mm_interconnect_0_hex4_s1_writedata),                       //                                .writedata
		.hex4_s1_chipselect                      (mm_interconnect_0_hex4_s1_chipselect),                      //                                .chipselect
		.hex5_s1_address                         (mm_interconnect_0_hex5_s1_address),                         //                         hex5_s1.address
		.hex5_s1_write                           (mm_interconnect_0_hex5_s1_write),                           //                                .write
		.hex5_s1_readdata                        (mm_interconnect_0_hex5_s1_readdata),                        //                                .readdata
		.hex5_s1_writedata                       (mm_interconnect_0_hex5_s1_writedata),                       //                                .writedata
		.hex5_s1_chipselect                      (mm_interconnect_0_hex5_s1_chipselect),                      //                                .chipselect
		.jtag_uart_avalon_jtag_slave_address     (mm_interconnect_0_jtag_uart_avalon_jtag_slave_address),     //     jtag_uart_avalon_jtag_slave.address
		.jtag_uart_avalon_jtag_slave_write       (mm_interconnect_0_jtag_uart_avalon_jtag_slave_write),       //                                .write
		.jtag_uart_avalon_jtag_slave_read        (mm_interconnect_0_jtag_uart_avalon_jtag_slave_read),        //                                .read
		.jtag_uart_avalon_jtag_slave_readdata    (mm_interconnect_0_jtag_uart_avalon_jtag_slave_readdata),    //                                .readdata
		.jtag_uart_avalon_jtag_slave_writedata   (mm_interconnect_0_jtag_uart_avalon_jtag_slave_writedata),   //                                .writedata
		.jtag_uart_avalon_jtag_slave_waitrequest (mm_interconnect_0_jtag_uart_avalon_jtag_slave_waitrequest), //                                .waitrequest
		.jtag_uart_avalon_jtag_slave_chipselect  (mm_interconnect_0_jtag_uart_avalon_jtag_slave_chipselect),  //                                .chipselect
		.led_s1_address                          (mm_interconnect_0_led_s1_address),                          //                          led_s1.address
		.led_s1_write                            (mm_interconnect_0_led_s1_write),                            //                                .write
		.led_s1_readdata                         (mm_interconnect_0_led_s1_readdata),                         //                                .readdata
		.led_s1_writedata                        (mm_interconnect_0_led_s1_writedata),                        //                                .writedata
		.led_s1_chipselect                       (mm_interconnect_0_led_s1_chipselect),                       //                                .chipselect
		.onchip_memory_s1_address                (mm_interconnect_0_onchip_memory_s1_address),                //                onchip_memory_s1.address
		.onchip_memory_s1_write                  (mm_interconnect_0_onchip_memory_s1_write),                  //                                .write
		.onchip_memory_s1_readdata               (mm_interconnect_0_onchip_memory_s1_readdata),               //                                .readdata
		.onchip_memory_s1_writedata              (mm_interconnect_0_onchip_memory_s1_writedata),              //                                .writedata
		.onchip_memory_s1_byteenable             (mm_interconnect_0_onchip_memory_s1_byteenable),             //                                .byteenable
		.onchip_memory_s1_chipselect             (mm_interconnect_0_onchip_memory_s1_chipselect),             //                                .chipselect
		.onchip_memory_s1_clken                  (mm_interconnect_0_onchip_memory_s1_clken),                  //                                .clken
		.switch_s1_address                       (mm_interconnect_0_switch_s1_address),                       //                       switch_s1.address
		.switch_s1_readdata                      (mm_interconnect_0_switch_s1_readdata),                      //                                .readdata
		.sysid_qsys_0_control_slave_address      (mm_interconnect_0_sysid_qsys_0_control_slave_address),      //      sysid_qsys_0_control_slave.address
		.sysid_qsys_0_control_slave_readdata     (mm_interconnect_0_sysid_qsys_0_control_slave_readdata)      //                                .readdata
	);

	Lab2_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.sender_irq    (cpu_irq_irq)                     //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                     // reset_in0.reset
		.clk            (clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),     // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req), //          .reset_req
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule
