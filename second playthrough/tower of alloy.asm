const disk_nr R1
const source R2
const dest R3
const spare R4
const move_src R5
const move_dest R6
const one R7
const three R8

const move_0 0
const move_1 1
const move_2 2
const toggle_magnent 5

CALL load_inputs
CALL hanoi


label hanoi
BEQ disk_nr R0 return
SUB disk_nr one disk_nr
SUB three dest dest
SUB dest source dest
CALL hanoi
SUB three dest dest
SUB dest source dest
COPY source RLIO
LOAD 5 RLIO
COPY dest RLIO
LOAD 5 RLIO
SUB three source source
SUB source dest source
CALL hanoi
SUB three source source
SUB source dest source
ADD one disk_nr disk_nr
label return
RET




label load_inputs
COPY RLIO disk_nr
COPY RLIO source
COPY RLIO dest
COPY RLIO spare
LOAD 1 one
LOAD 3 R8
ADD one disk_nr disk_nr
RET
