extends Control

@export var button_load_input: Button
@export var text_edit_input: TextEdit

@export var button_run: Button
@export var label_output: Label

func _ready() -> void:
	button_load_input.button_down.connect(_on_load_input)
	button_run.button_down.connect(_on_run)

func _on_load_input() -> void:
	print("loading data...")
	
func _on_run() -> void:
	var script = preload("res://days/day01.gd").new()
	script.run("Hello World")