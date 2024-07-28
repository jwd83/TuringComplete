# start of algo
label start
# we take 3 cards
ADDii 3 0 ROUT
# we read the number of cards left
label read_board
ADDri RIN 0 R0
# check if less than or equal to 4
JLEri R0 4 win
# check if less than or equal to 5
JLEri R0 5 win5
# check if less than or equal to 5
JLEri R0 6 win6
# jump back to start
JLEri R0 7 win7
# jump back to start
JEQii 0 0 start
label win
SUBri R0 1 R0
ADDri R0 0 ROUT
label win5
ADDii 1 0 ROUT
JEQii 0 0 read_board
label win6
ADDii 1 0 ROUT
JEQii 0 0 read_board
label win7
ADDii 2 0 ROUT
JEQii 0 0 read_board
