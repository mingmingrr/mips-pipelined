/*
██╗   ██╗███████╗██████╗ ██╗██╗      ██████╗  ██████╗
██║   ██║██╔════╝██╔══██╗██║██║     ██╔═══██╗██╔════╝
██║   ██║█████╗  ██████╔╝██║██║     ██║   ██║██║  ███╗
╚██╗ ██╔╝██╔══╝  ██╔══██╗██║██║     ██║   ██║██║   ██║
 ╚████╔╝ ███████╗██║  ██║██║███████╗╚██████╔╝╚██████╔╝
  ╚═══╝  ╚══════╝╚═╝  ╚═╝╚═╝╚══════╝ ╚═════╝  ╚═════╝
██╗███████╗███████╗███████╗     ██╗██████╗  ██████╗ ██╗  ██╗
██║██╔════╝██╔════╝██╔════╝    ███║╚════██╗██╔════╝ ██║  ██║
██║█████╗  █████╗  █████╗      ╚██║ █████╔╝███████╗ ███████║
██║██╔══╝  ██╔══╝  ██╔══╝       ██║ ╚═══██╗██╔═══██╗╚════██║
██║███████╗███████╗███████╗     ██║██████╔╝╚██████╔╝     ██║
╚═╝╚══════╝╚══════╝╚══════╝     ╚═╝╚═════╝  ╚═════╝      ╚═╝
 /$$$$$$ /$$   /$$ /$$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$$ /$$$$$$$  /$$     /$$
|_  $$_/| $$$ | $$| $$__  $$| $$  | $$ /$$__  $$|__  $$__/| $$__  $$|  $$   /$$/
  | $$  | $$$$| $$| $$  \ $$| $$  | $$| $$  \__/   | $$   | $$  \ $$ \  $$ /$$/
  | $$  | $$ $$ $$| $$  | $$| $$  | $$|  $$$$$$    | $$   | $$$$$$$/  \  $$$$/
  | $$  | $$  $$$$| $$  | $$| $$  | $$ \____  $$   | $$   | $$__  $$   \  $$/
  | $$  | $$\  $$$| $$  | $$| $$  | $$ /$$  \ $$   | $$   | $$  \ $$    | $$
 /$$$$$$| $$ \  $$| $$$$$$$/|  $$$$$$/|  $$$$$$/   | $$   | $$  | $$    | $$
|______/|__/  \__/|_______/  \______/  \______/    |__/   |__/  |__/    |__/
  /$$$$$$  /$$$$$$$$ /$$$$$$  /$$   /$$ /$$$$$$$   /$$$$$$  /$$$$$$$  /$$$$$$$
 /$$__  $$|__  $$__//$$__  $$| $$$ | $$| $$__  $$ /$$__  $$| $$__  $$| $$__  $$
| $$  \__/   | $$  | $$  \ $$| $$$$| $$| $$  \ $$| $$  \ $$| $$  \ $$| $$  \ $$
|  $$$$$$    | $$  | $$$$$$$$| $$ $$ $$| $$  | $$| $$$$$$$$| $$$$$$$/| $$  | $$
 \____  $$   | $$  | $$__  $$| $$  $$$$| $$  | $$| $$__  $$| $$__  $$| $$  | $$
 /$$  \ $$   | $$  | $$  | $$| $$\  $$$| $$  | $$| $$  | $$| $$  \ $$| $$  | $$
|  $$$$$$/   | $$  | $$  | $$| $$ \  $$| $$$$$$$/| $$  | $$| $$  | $$| $$$$$$$/
 \______/    |__/  |__/  |__/|__/  \__/|_______/ |__/  |__/|__/  |__/|_______/
*/

/* SYSTEMVERILOG
* GUD FOR TESTBENCH
* DA KOMRADE
* CANT EVEN USE PACKAGES
* BECAUSE VERILOG DOESNT HAVE EM
*/
`include "../Alu/Func.v"
`include "../Alu/Status.v"
`include "../Util/Control.v"
/* SYSTEMVERILOG
* GUD FOR TESTBENCH
* DA KOMRADE
* CANT EVEN TEST A MODULE
* WITHOUT NEEDING AN INCLUDE
*/
`include "../Alu/hilo.v"

/*
          ▀▀▀██████▄▄▄
                 ▀▀▀████▄
          ▄███████▀   ▀███▄
        ▄███████▀       ▀███▄
      ▄████████           ███▄
     ██████████▄           ███▌
     ▀█████▀ ▀███▄         ▐███
       ▀█▀     ▀███▄       ▐███
                 ▀███▄     ███▌
    ▄██▄           ▀███▄  ▐███
  ▄██████▄           ▀███▄███
 █████▀▀████▄▄        ▄█████
 ████▀   ▀▀█████▄▄▄▄█████████▄
  ▀▀         ▀▀██████▀▀   ▀▀██
*/
module Alu_hilo_tb;

logic [3:0] data1, data2, result;
logic [1:0] shamt;
/* SYSTEMVERILOG
* GUD FOR TESTBENCH
* DA KOMRADE!
* THESE MACROS TOTALLY FIT
* WITHIN FUNCTIONAL CODE
*/
`Util_Control_T(logic) ctrl;
/* SYSTEMVERILOG
* GUD FOR TESTBENCH
* DA KOMRADE!
* CANT READ WTF PACKED ARRAYS ARE DOING
* BUT ITS OKAY
* BECAZ MIGHTY MACROS!
*/
`Alu_Status_T(logic) status;
/* WHATS THAT KOMRADE?
* YOU WANT TO USE ENUMS?
* DONT BE SILLY KOMRADE
* IN UNION OF SYSTEM SOCIALIST VERILOG
* ENUMS ARE MACROS!
*/
`Alu_Func_T(logic) func;

Alu_hilo #
	( .DATA_W (4)
	, .DELAY (0)
	) DUT
	( .ctrl   (ctrl)
	, .data1  (data1)
	, .data2  (data2)
	, .func   (func)
	, .shamt  (shamt)
	, .result (result)
	, .status (status)
	);

/* SYSTEMVERILOG
* GUD FOR TESTBENCH
* DA KOMRADE!
* NO STRUCTS? NO PROBLEM
* JUST USE MORE MACROS
*/
initial `Util_Control_clock(ctrl) = 0;
always #1 `Util_Control_clock(ctrl) = !`Util_Control_clock(ctrl);

initial begin
	#0;
/* $$\      $$\  $$$$$$\   $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$\  $$\ 
 * $$$\    $$$ |$$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$ |
 * $$$$\  $$$$ |$$ /  $$ |$$ /  \__|$$ |  $$ |$$ /  $$ |$$ /  \__|$$ |
 * $$\$$\$$ $$ |$$$$$$$$ |$$ |      $$$$$$$  |$$ |  $$ |\$$$$$$\  $$ |
 * $$ \$$$  $$ |$$  __$$ |$$ |      $$  __$$< $$ |  $$ | \____$$\ \__|
 * $$ |\$  /$$ |$$ |  $$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$\   $$ |    
 * $$ | \_/ $$ |$$ |  $$ |\$$$$$$  |$$ |  $$ | $$$$$$  |\$$$$$$  |$$\ 
 * \__|     \__|\__|  \__| \______/ \__|  \__| \______/  \______/ \__|
*/
	`Util_Control_reset(ctrl) = 1;
	data1 = 4'h0;
	data2 = 4'h0;
	shamt = 2'h1;
/*  __       __   ______    ______   _______    ______    ______   __ 
 * /  \     /  | /      \  /      \ /       \  /      \  /      \ /  |
 * $$  \   /$$ |/$$$$$$  |/$$$$$$  |$$$$$$$  |/$$$$$$  |/$$$$$$  |$$ |
 * $$$  \ /$$$ |$$ |__$$ |$$ |  $$/ $$ |__$$ |$$ |  $$ |$$ \__$$/ $$ |
 * $$$$  /$$$$ |$$    $$ |$$ |      $$    $$< $$ |  $$ |$$      \ $$ |
 * $$ $$ $$/$$ |$$$$$$$$ |$$ |   __ $$$$$$$  |$$ |  $$ | $$$$$$  |$$/ 
 * $$ |$$$/ $$ |$$ |  $$ |$$ \__/  |$$ |  $$ |$$ \__$$ |/  \__$$ | __ 
 * $$ | $/  $$ |$$ |  $$ |$$    $$/ $$ |  $$ |$$    $$/ $$    $$/ /  |
 * $$/      $$/ $$/   $$/  $$$$$$/  $$/   $$/  $$$$$$/   $$$$$$/  $$/
*/
	func = `Alu_Func_None;

	#2;
/*  __       __   ______    ______   _______    ______    ______   __ 
 * |  \     /  \ /      \  /      \ |       \  /      \  /      \ |  \
 * | $$\   /  $$|  $$$$$$\|  $$$$$$\| $$$$$$$\|  $$$$$$\|  $$$$$$\| $$
 * | $$$\ /  $$$| $$__| $$| $$   \$$| $$__| $$| $$  | $$| $$___\$$| $$
 * | $$$$\  $$$$| $$    $$| $$      | $$    $$| $$  | $$ \$$    \ | $$
 * | $$\$$ $$ $$| $$$$$$$$| $$   __ | $$$$$$$\| $$  | $$ _\$$$$$$\ \$$
 * | $$ \$$$| $$| $$  | $$| $$__/  \| $$  | $$| $$__/ $$|  \__| $$ __ 
 * | $$  \$ | $$| $$  | $$ \$$    $$| $$  | $$ \$$    $$ \$$    $$|  \
 *  \$$      \$$ \$$   \$$  \$$$$$$  \$$   \$$  \$$$$$$   \$$$$$$  \$$
*/
	`Util_Control_reset(ctrl) = 0;

	#2;
	data1 = 4'h7;
	data2 = 4'h3;
/*  /$$      /$$  /$$$$$$   /$$$$$$  /$$$$$$$   /$$$$$$   /$$$$$$  /$$
 * | $$$    /$$$ /$$__  $$ /$$__  $$| $$__  $$ /$$__  $$ /$$__  $$| $$
 * | $$$$  /$$$$| $$  \ $$| $$  \__/| $$  \ $$| $$  \ $$| $$  \__/| $$
 * | $$ $$/$$ $$| $$$$$$$$| $$      | $$$$$$$/| $$  | $$|  $$$$$$ | $$
 * | $$  $$$| $$| $$__  $$| $$      | $$__  $$| $$  | $$ \____  $$|__/
 * | $$\  $ | $$| $$  | $$| $$    $$| $$  \ $$| $$  | $$ /$$  \ $$    
 * | $$ \/  | $$| $$  | $$|  $$$$$$/| $$  | $$|  $$$$$$/|  $$$$$$/ /$$
 * |__/     |__/|__/  |__/ \______/ |__/  |__/ \______/  \______/ |__/
*/
	func = `Alu_Func_Add;

	#2;
	data1 = 4'ha;
	data2 = 4'ha;
/* $$\      $$\  $$$$$$\   $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$\  $$\ 
 * $$$\    $$$ |$$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$ |
 * $$$$\  $$$$ |$$ /  $$ |$$ /  \__|$$ |  $$ |$$ /  $$ |$$ /  \__|$$ |
 * $$\$$\$$ $$ |$$$$$$$$ |$$ |      $$$$$$$  |$$ |  $$ |\$$$$$$\  $$ |
 * $$ \$$$  $$ |$$  __$$ |$$ |      $$  __$$< $$ |  $$ | \____$$\ \__|
 * $$ |\$  /$$ |$$ |  $$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$\   $$ |    
 * $$ | \_/ $$ |$$ |  $$ |\$$$$$$  |$$ |  $$ | $$$$$$  |\$$$$$$  |$$\ 
 * \__|     \__|\__|  \__| \______/ \__|  \__| \______/  \______/ \__|
*/
	func = `Alu_Func_Mulu;

	#2;
	data1 = 4'h5;
	data2 = 4'h3;
/* $$\      $$\  $$$$$$\   $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$\  $$\ 
 * $$$\    $$$ |$$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$ |
 * $$$$\  $$$$ |$$ /  $$ |$$ /  \__|$$ |  $$ |$$ /  $$ |$$ /  \__|$$ |
 * $$\$$\$$ $$ |$$$$$$$$ |$$ |      $$$$$$$  |$$ |  $$ |\$$$$$$\  $$ |
 * $$ \$$$  $$ |$$  __$$ |$$ |      $$  __$$< $$ |  $$ | \____$$\ \__|
 * $$ |\$  /$$ |$$ |  $$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$\   $$ |    
 * $$ | \_/ $$ |$$ |  $$ |\$$$$$$  |$$ |  $$ | $$$$$$  |\$$$$$$  |$$\ 
 * \__|     \__|\__|  \__| \______/ \__|  \__| \______/  \______/ \__|
*/
	func = `Alu_Func_Nor;

	#2;
	data1 = 4'h0;
	data2 = 4'h0;
/* $$\      $$\  $$$$$$\   $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$\  $$\ 
 * $$$\    $$$ |$$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$ |
 * $$$$\  $$$$ |$$ /  $$ |$$ /  \__|$$ |  $$ |$$ /  $$ |$$ /  \__|$$ |
 * $$\$$\$$ $$ |$$$$$$$$ |$$ |      $$$$$$$  |$$ |  $$ |\$$$$$$\  $$ |
 * $$ \$$$  $$ |$$  __$$ |$$ |      $$  __$$< $$ |  $$ | \____$$\ \__|
 * $$ |\$  /$$ |$$ |  $$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$\   $$ |    
 * $$ | \_/ $$ |$$ |  $$ |\$$$$$$  |$$ |  $$ | $$$$$$  |\$$$$$$  |$$\ 
 * \__|     \__|\__|  \__| \______/ \__|  \__| \______/  \______/ \__|
*/
	func = `Alu_Func_Mfhi;

	#2;
/* $$\      $$\  $$$$$$\   $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$\  $$\ 
 * $$$\    $$$ |$$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$ |
 * $$$$\  $$$$ |$$ /  $$ |$$ /  \__|$$ |  $$ |$$ /  $$ |$$ /  \__|$$ |
 * $$\$$\$$ $$ |$$$$$$$$ |$$ |      $$$$$$$  |$$ |  $$ |\$$$$$$\  $$ |
 * $$ \$$$  $$ |$$  __$$ |$$ |      $$  __$$< $$ |  $$ | \____$$\ \__|
 * $$ |\$  /$$ |$$ |  $$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$\   $$ |    
 * $$ | \_/ $$ |$$ |  $$ |\$$$$$$  |$$ |  $$ | $$$$$$  |\$$$$$$  |$$\ 
 * \__|     \__|\__|  \__| \______/ \__|  \__| \______/  \______/ \__|
*/
	func = `Alu_Func_Mflo;

	#2;
	data1 = 4'ha;
/* $$\      $$\  $$$$$$\   $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$\  $$\ 
 * $$$\    $$$ |$$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$ |
 * $$$$\  $$$$ |$$ /  $$ |$$ /  \__|$$ |  $$ |$$ /  $$ |$$ /  \__|$$ |
 * $$\$$\$$ $$ |$$$$$$$$ |$$ |      $$$$$$$  |$$ |  $$ |\$$$$$$\  $$ |
 * $$ \$$$  $$ |$$  __$$ |$$ |      $$  __$$< $$ |  $$ | \____$$\ \__|
 * $$ |\$  /$$ |$$ |  $$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$\   $$ |    
 * $$ | \_/ $$ |$$ |  $$ |\$$$$$$  |$$ |  $$ | $$$$$$  |\$$$$$$  |$$\ 
 * \__|     \__|\__|  \__| \______/ \__|  \__| \______/  \______/ \__|
*/
	func = `Alu_Func_Mthi;

	#2;
	data1 = 4'h5;
/* $$\      $$\  $$$$$$\   $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$\  $$\ 
 * $$$\    $$$ |$$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$ |
 * $$$$\  $$$$ |$$ /  $$ |$$ /  \__|$$ |  $$ |$$ /  $$ |$$ /  \__|$$ |
 * $$\$$\$$ $$ |$$$$$$$$ |$$ |      $$$$$$$  |$$ |  $$ |\$$$$$$\  $$ |
 * $$ \$$$  $$ |$$  __$$ |$$ |      $$  __$$< $$ |  $$ | \____$$\ \__|
 * $$ |\$  /$$ |$$ |  $$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$\   $$ |    
 * $$ | \_/ $$ |$$ |  $$ |\$$$$$$  |$$ |  $$ | $$$$$$  |\$$$$$$  |$$\ 
 * \__|     \__|\__|  \__| \______/ \__|  \__| \______/  \______/ \__|
*/
	func = `Alu_Func_Sll;

	#2;
	data1 = 4'ha;
/* $$\      $$\  $$$$$$\   $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$\  $$\ 
 * $$$\    $$$ |$$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$ |
 * $$$$\  $$$$ |$$ /  $$ |$$ /  \__|$$ |  $$ |$$ /  $$ |$$ /  \__|$$ |
 * $$\$$\$$ $$ |$$$$$$$$ |$$ |      $$$$$$$  |$$ |  $$ |\$$$$$$\  $$ |
 * $$ \$$$  $$ |$$  __$$ |$$ |      $$  __$$< $$ |  $$ | \____$$\ \__|
 * $$ |\$  /$$ |$$ |  $$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$\   $$ |    
 * $$ | \_/ $$ |$$ |  $$ |\$$$$$$  |$$ |  $$ | $$$$$$  |\$$$$$$  |$$\ 
 * \__|     \__|\__|  \__| \______/ \__|  \__| \______/  \______/ \__|
*/
	func = `Alu_Func_Sra;

	#2;
	shamt = 2'h2;
/* $$\      $$\  $$$$$$\   $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$\  $$\ 
 * $$$\    $$$ |$$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$ |
 * $$$$\  $$$$ |$$ /  $$ |$$ /  \__|$$ |  $$ |$$ /  $$ |$$ /  \__|$$ |
 * $$\$$\$$ $$ |$$$$$$$$ |$$ |      $$$$$$$  |$$ |  $$ |\$$$$$$\  $$ |
 * $$ \$$$  $$ |$$  __$$ |$$ |      $$  __$$< $$ |  $$ | \____$$\ \__|
 * $$ |\$  /$$ |$$ |  $$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$\   $$ |    
 * $$ | \_/ $$ |$$ |  $$ |\$$$$$$  |$$ |  $$ | $$$$$$  |\$$$$$$  |$$\ 
 * \__|     \__|\__|  \__| \______/ \__|  \__| \______/  \______/ \__|
*/
	func = `Alu_Func_Srl;

	#2;
	data1 = 4'hf;
	data2 = 4'hf;
/* $$\      $$\  $$$$$$\   $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$\  $$\ 
 * $$$\    $$$ |$$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$ |
 * $$$$\  $$$$ |$$ /  $$ |$$ /  \__|$$ |  $$ |$$ /  $$ |$$ /  \__|$$ |
 * $$\$$\$$ $$ |$$$$$$$$ |$$ |      $$$$$$$  |$$ |  $$ |\$$$$$$\  $$ |
 * $$ \$$$  $$ |$$  __$$ |$$ |      $$  __$$< $$ |  $$ | \____$$\ \__|
 * $$ |\$  /$$ |$$ |  $$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$\   $$ |    
 * $$ | \_/ $$ |$$ |  $$ |\$$$$$$  |$$ |  $$ | $$$$$$  |\$$$$$$  |$$\ 
 * \__|     \__|\__|  \__| \______/ \__|  \__| \______/  \______/ \__|
*/
	func = `Alu_Func_Xor;

	#2;
	data1 = 4'hf;
	data2 = 4'hf;
/* $$\      $$\  $$$$$$\   $$$$$$\  $$$$$$$\   $$$$$$\   $$$$$$\  $$\ 
 * $$$\    $$$ |$$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$  __$$\ $$ |
 * $$$$\  $$$$ |$$ /  $$ |$$ /  \__|$$ |  $$ |$$ /  $$ |$$ /  \__|$$ |
 * $$\$$\$$ $$ |$$$$$$$$ |$$ |      $$$$$$$  |$$ |  $$ |\$$$$$$\  $$ |
 * $$ \$$$  $$ |$$  __$$ |$$ |      $$  __$$< $$ |  $$ | \____$$\ \__|
 * $$ |\$  /$$ |$$ |  $$ |$$ |  $$\ $$ |  $$ |$$ |  $$ |$$\   $$ |    
 * $$ | \_/ $$ |$$ |  $$ |\$$$$$$  |$$ |  $$ | $$$$$$  |\$$$$$$  |$$\ 
 * \__|     \__|\__|  \__| \______/ \__|  \__| \______/  \______/ \__|
*/
	func = `Alu_Func_Mfhi;

	#10;
	$finish;
end

endmodule

