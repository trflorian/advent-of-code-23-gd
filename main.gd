extends Control

@export var button_load_input: Button
@export var text_edit_input: TextEdit

@export var button_run: Button
@export var line_edit_output: LineEdit

@export var http_request: HTTPRequest

func _ready() -> void:
	button_load_input.button_down.connect(_on_load_input)
	button_run.button_down.connect(_on_run)
	http_request.request_completed.connect(_on_data_loaded)

func _on_load_input() -> void:
	var day = 1
	http_request.request("https://adventofcode.com/2023/day/%d/input" % day, [
		"Cookie: session=53616c7465645f5fa098c80954405e1b1ca70cd0d51b2105e578f9e808506589bb2127e5951b655ba555e9cc1127ca207e4e60a7d36387f503f0aa8c36c63fc4"
	])

func _on_data_loaded(result, response_code, headers, body) -> void:
	text_edit_input.text = body.get_string_from_utf8()

func _on_run() -> void:
	var script = preload("res://days/day01.gd").new()
	var output = script.run(text_edit_input.text)
	line_edit_output.text = output
