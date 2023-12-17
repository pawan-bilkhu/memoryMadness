extends CanvasLayer

@onready var main_scene = $MainScene
@onready var game_scene = $GameScene
@onready var sound = $Sound

# Called when the node enters the scene tree for the first time.
func _ready():
	on_exit_game_pressed()
	SignalManager.on_exit_game_pressed.connect(on_exit_game_pressed)
	SignalManager.on_level_selected.connect(on_level_selected)


func display_game(visibility: bool) -> void:
	game_scene.visible = visibility
	main_scene.visible = !visibility
	
func on_exit_game_pressed() -> void:
	display_game(false)
	SoundManager.play_sound(sound, SoundManager.SOUND_MAIN_MENU)
	GameManager.remove_node_group(GameManager.GROUP_TILE)

func on_level_selected(level_number: int) -> void:
	display_game(true)
	SoundManager.play_sound(sound, SoundManager.SOUND_IN_GAME)
