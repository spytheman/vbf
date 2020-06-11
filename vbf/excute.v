module main

#include "stdio.h"

fn C.scanf() int

fn excute(input []Instruction){
	mut data := [0].repeat(data_size)
	mut data_ptr := 0
	for pc := 0; pc < (input.len); pc++ {
		if input[pc].operator == op_inc_dp {
			data_ptr++
        }else if input[pc].operator == op_dec_dp {
            data_ptr--
        }else if input[pc].operator == op_inc_val {
            data[data_ptr]++
        }else if input[pc].operator == op_dec_val {
            data[data_ptr]--
        }else if input[pc].operator == op_out {
            C.printf('%c', data[data_ptr])
        }else if input[pc].operator == op_in {
            cb := 0
            C.scanf('%c', &cb)    
            data[data_ptr] = cb
        }else if input[pc].operator == op_jmp_fwd {
			if data[data_ptr] == 0 {
				pc = input[pc].operand
			}
        }else if input[pc].operator == op_jmp_bck {
			if data[data_ptr] > 0 {
				pc = input[pc].operand
			}
        }else{
            println('Execution error')
        }
	}
}