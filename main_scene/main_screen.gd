extends Control

@export var level_button_scene: PackedScene
@onready var h_box_container_levels = $VBoxContainer/HBoxContainerLevels

# Called when the node enters the scene tree for the first time.
func _ready():
	setup_level_buttons()

func create_level_button(level_number) -> void:
	var new_level_button = level_button_scene.instantiate()
	h_box_container_levels.add_child(new_level_button)
	new_level_button.set_level_label(level_number)
	

func setup_level_buttons() -> void:
	for level in GameManager.LEVELS:
		create_level_button(level)
