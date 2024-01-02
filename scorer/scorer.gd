extends Node

@onready var audio_stream_player = $AudioStreamPlayer
@onready var reveal_timer = $RevealTimer

var _selections: Array = []
var _target_pairs: int = 0
var _moves_made: int = 0
var _pairs_made: int = 0



# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_tile_selected.connect(on_tile_selected)
	SignalManager.on_exit_game_pressed.connect(on_exit_game_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func clear_new_game(target_pairs: int ) -> void:
	_selections.clear()
	_pairs_made = 0
	_moves_made = 0
	_target_pairs = target_pairs

func successful_pair() -> bool:
	return ( 
		_selections[0].get_instance_id() != _selections[1].get_instance_id() 
		and
		_selections[0].get_item_name() == _selections[1].get_item_name() 
		)

func destroy_tiles() -> void:
	for s in _selections:
		s.match_found()
	_pairs_made += 1
	SoundManager.play_sound(audio_stream_player, SoundManager.SOUND_SUCCESS)

func update_selections() -> void:
	reveal_timer.start()
	if successful_pair():
		destroy_tiles()

func check_pair_made(tile: MemoryTile) -> void:
	tile.display_item(true)
	_selections.append(tile)
	if _selections.size() != 2:
		return
	SignalManager.on_selection_disabled.emit()
	_moves_made += 1
	
	update_selections()

func hide_selections() -> void:
	for tile in _selections:
		tile.display_item(false)

func on_tile_selected(tile: MemoryTile) -> void:
	SoundManager.on_tile_pressed(audio_stream_player)
	check_pair_made(tile)


func _on_reveal_timer_timeout():
	if not successful_pair():
		hide_selections()
	_selections.clear()
	SignalManager.on_selection_enabled.emit()

func on_exit_game_pressed() -> void:
	reveal_timer.stop()
