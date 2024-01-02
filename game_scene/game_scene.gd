extends Control

@export var memory_tile_scene: PackedScene
@onready var tile_container = $HBoxContainer/MarginContainerTiles/TileContainer
@onready var audio_stream_player = $AudioStreamPlayer
@onready var scorer: Scorer = $Scorer
@onready var moves_amount_label = $HBoxContainer/MarginContainerTextLabels/VBoxContainer/HBoxContainer/MovesAmountLabel
@onready var pairs_amount_label = $HBoxContainer/MarginContainerTextLabels/VBoxContainer/HBoxContainer2/PairsAmountLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_level_selected.connect(on_level_selected)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	moves_amount_label.text = scorer.get_moves_made_str()
	pairs_amount_label.text = scorer.get_pairs_made_str()
	
func generate_memory_tile(item_image_dictionary: Dictionary, image: CompressedTexture2D) -> void:
	var new_tile = memory_tile_scene.instantiate()
	tile_container.add_child(new_tile)
	new_tile.setup(item_image_dictionary, image)

func on_level_selected(level_number: int) -> void:
	var level_selection = GameManager.get_level_selection(level_number)
	var frame_image = ImageManager.get_random_frame_image()
	
	tile_container.columns = level_selection.cols_quantity
	
	for item_image_dictionary in level_selection.image_list:
		generate_memory_tile(item_image_dictionary, frame_image)
	
	scorer.clear_new_game(level_selection.target_pairs)

func _on_exit_button_pressed():
	SoundManager.on_play_button_pressed(audio_stream_player)
	SignalManager.on_exit_game_pressed.emit()
