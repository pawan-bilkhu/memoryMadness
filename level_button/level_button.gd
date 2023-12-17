extends TextureButton
@onready var level_label = $LevelLabel
@onready var audio_stream_player = $AudioStreamPlayer

var _level_number: int = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func set_level_label(level_number: int) -> void:
	_level_number = level_number
	var level_data = GameManager.LEVELS[_level_number]
	level_label.text = "%s x %s" % [level_data.rows, level_data.cols]
	


func _on_pressed():
	SoundManager.on_play_button_pressed(audio_stream_player)
	SignalManager.on_level_selected.emit(_level_number)
