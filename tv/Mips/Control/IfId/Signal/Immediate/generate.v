`include "Mips/Instruction/Category/Category.v"
`include "Mips/Instruction/OpFunc/OpFunc.v"
`include "Mips/Instruction/OpFunc/OpFuncs.v"
`include "Mips/Control/IfId/Signal/Immediate/Control.v"

module Mips_Control_IfId_Signal_Immediate_generate
	( `Mips_Instruction_OpFunc_OpFunc_T        (input)  opFunc
	, `Mips_Instruction_Category_Category_T    (input)  category
	, `Mips_Control_IfId_Signal_Immediate_Control_T (output) control
	);

`Mips_Control_IfId_Signal_Immediate_Control_Extend_T (reg) extend ;
`Mips_Control_IfId_Signal_Immediate_Control_Shift_T  (reg) shift  ;

always @(*)
	if(opFunc == `Mips_Instruction_OpFunc_OpFuncs_Lui)
		shift = `Mips_Control_IfId_Signal_Immediate_Signal_Shift_Left16 ;
	else
		shift = `Mips_Control_IfId_Signal_Immediate_Signal_Shift_None   ;

always @(*)
	if(`Mips_Instruction_Category_Category_Logical(category))
		extend = `Mips_Control_IfId_Signal_Immediate_Signal_Extend_Unsigned;
	else
		case(opFunc)
			`Mips_Instruction_OpFunc_OpFuncs_Addiu : extend = `Mips_Control_IfId_Signal_Immediate_Signal_Extend_Unsigned;
			`Mips_Instruction_OpFunc_OpFuncs_Sltiu : extend = `Mips_Control_IfId_Signal_Immediate_Signal_Extend_Unsigned;
			default                                : extend = `Mips_Control_IfId_Signal_Immediate_Signal_Extend_Signed;
		endcase

assign control = `Mips_Control_IfId_Signal_Immediate_Control_Init_Defaults;

endmodule

