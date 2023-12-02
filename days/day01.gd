extends Node

func run(input: String) -> String:
	var output: int = 0
	for line in input.split("\n"):
		var digits = process_line(line)
		output += digits[0] * 10 + digits[1]
	return str(output)

func process_line(line: String):
	var digits: Array[int] = []
	for char in line:
		if char.is_valid_int():
			digits.append(char.to_int())
	return [digits[0], digits[-1]]
