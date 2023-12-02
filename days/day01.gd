extends Node

func run(input: String) -> String:
	var output: int = 0
	for line in input.split("\n"):
		var digits = process_line(line)
		output += digits[0] * 10 + digits[1]
	return str(output)

func process_line(line: String):
	var digits: Array[int] = []
	
	
	var spelled_out_digits = {
		"one": 1,
		"two": 2,
		"three": 3,
		"four": 4,
		"five": 5,
		"six": 6,
		"seven": 7,
		"eight": 8,
		"nine": 9
	}
	
	for sd in spelled_out_digits.keys():
		var digit: int = spelled_out_digits[sd]
		# eightwothree -> eight8eighttwo2two
		line = line.replace(sd, sd + str(digit) + sd)
	
	for char in line:
		if char.is_valid_int():
			digits.append(char.to_int())
	return [digits[0], digits[-1]]
