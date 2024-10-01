# naming simplification
const adr RRA
const ram RRIO
const io RLIO
const zero R0
const cur_val R1
const max_left R2
const max_right R3
const sum R4
const num_reads R5
const one R6
const sixteen R7
const offset R8




# READ VALUES INTO RAM
# FROM INPUT


# use r6 to inc/dec by one
LOAD 1 one
LOAD 16 sixteen
LOAD 16 num_reads


label read_values
# store io into to ram
COPY io ram # ram = io
# increment ram address
ADD adr one adr # adr = adr + 1
BNE adr num_reads read_values

# setup for read_from_left
## adr and num_reads are both 16
LOAD 0 adr # adr = 0
LOAD 15 offset # offset = 15
# adr now 0, num_reads 16

label read_from_left
COPY ram cur_val # cur_val = RAM

# case a: cv=9, ml=8
# case b: cv=9, ml=9
# cur_val > max_left
# a: true
# b: false
# becomes...
# max_left < cur_val
# a: true
# b: false

BLT max_left cur_val set_max_left
JUMP done_set_max_left
label set_max_left
COPY cur_val max_left
label done_set_max_left
ADD adr sixteen adr # adr = adr + 16
SUB max_left cur_val ram
SUB adr offset adr # adr -= offset (15)
SUB num_reads one num_reads # num_reads -= 1
BNE num_reads zero read_from_left

# setup for read from right
LOAD 15 adr
LOAD 16 num_reads
LOAD 17 offset # offset = 17

label read_from_right
COPY ram cur_val # cur_val = RAM
BLT max_right cur_val set_max_right
JUMP done_set_max_right
label set_max_right
COPY cur_val max_right
label done_set_max_right
SUB max_right cur_val cur_val # = cur_val = max_right - cur_val
ADD adr sixteen adr # adr += 16
BLT cur_val ram set_actual
JUMP done_set_actual
label set_actual
COPY cur_val ram
label done_set_actual
SUB adr offset adr # adr -= offset (17)
SUB num_reads one num_reads # num_reads -= 1
BNE num_reads zero read_from_right # if num_reads != 0 GOTO read_from_right

# setup for sum_values

LOAD 16 adr
LOAD 16 num_reads

label sum_values
ADD sum ram sum
ADD adr one adr
SUB num_reads one num_reads
BNE num_reads zero sum_values

COPY sum io
