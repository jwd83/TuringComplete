# a XOR b = (a OR b) - (a AND b)

# load the values of a and b
in_to_reg1 # r1 = a
in_to_reg2 # r2 = b

# compute the AND and OR
and				# r3 = a AND b
reg3_to_reg4		# r4 = r3
or				# r3 = a OR b

# load computed AND and OR
reg4_to_reg2		# r2 = r4 (a AND b)
reg3_to_reg1		# r1 = r3 (a OR b)

# subtract AND from OR
sub				# r3 = r1 - r2

# send out result
reg3_to_out		# out = r3