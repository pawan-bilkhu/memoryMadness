extends Control

@onready var moves_amount_label = $NinePatchRect/MarginContainer/VBoxContainer/HBoxContainer/MovesAmountLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_game_over.connect(on_game_over)


func on_game_over(moves: int) -> void:
	moves_amount_label.text = str(moves)
	show()


func _on_exit_button_pressed():
	hide()
	SignalManager.on_exit_game_pressed.emit()
