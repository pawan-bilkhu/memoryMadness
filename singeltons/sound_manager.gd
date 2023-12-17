extends Node

# -- sound_manager-- #


const SOUND_MAIN_MENU = "main"
const SOUND_IN_GAME = "ingame"
const SOUND_SUCCESS = "success"
const SOUND_GAME_OVER = "gameover"
const SOUND_SELECT_TILE = "tile"
const SOUND_SELECT_BUTTON = "button"


const SOUNDS = {
	SOUND_MAIN_MENU: preload("res://assets/sounds/bgm_action_3.mp3"),
	SOUND_IN_GAME: preload("res://assets/sounds/bgm_action_4.mp3"),
	SOUND_SUCCESS: preload("res://assets/sounds/sfx_sounds_fanfare3.wav"),
	SOUND_GAME_OVER: preload("res://assets/sounds/sfx_sounds_powerup12.wav"),
	SOUND_SELECT_TILE: preload("res://assets/sounds/sfx_sounds_impact1.wav"),
	SOUND_SELECT_BUTTON: preload("res://assets/sounds/sfx_sounds_impact7.wav")
}

func play_sound(audio_player: AudioStreamPlayer, key: String) -> void:
	if not SOUNDS.has(key):
		return
	audio_player.stop()
	audio_player.stream = SOUNDS[key]
	audio_player.play()

func on_play_button_pressed(audio_player: AudioStreamPlayer) -> void:
	play_sound(audio_player, SOUND_SELECT_BUTTON)
	
func on_tile_pressed(audio_player: AudioStreamPlayer) -> void:
	play_sound(audio_player, SOUND_SELECT_TILE)
	
