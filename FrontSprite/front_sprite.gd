extends TextureRect

const REDUCTION_SCALE_FACTOR: Vector2 = Vector2(0.1, 0.1)
const DEFAULT_SCALE_FACTOR: Vector2 = Vector2(1, 1)
const RANDOM_SPIN_DURATION: Vector2 = Vector2(1, 2)
const SCALE_DURATION: float = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	animate_sprite()

func set_random_sprite_image() -> void:
	var randomTexture = ImageManager.get_random_item_image().item_texture
	texture = randomTexture
	

func get_random_spin_duration() -> float:
	return randf_range(RANDOM_SPIN_DURATION.x, RANDOM_SPIN_DURATION.y)

func get_random_rotation() -> float:
	return randf_range(-2*PI, 2*PI)
	

func animate_sprite() -> void:
	var tween = get_tree().create_tween()
	tween.set_loops()
	tween.tween_callback(set_random_sprite_image)
	tween.tween_property(self, "scale", DEFAULT_SCALE_FACTOR, SCALE_DURATION)
	tween.tween_property(self, "rotation", get_random_rotation(), get_random_spin_duration())
	tween.tween_property(self, "rotation", get_random_rotation(), get_random_spin_duration())
	tween.tween_property(self, "scale", REDUCTION_SCALE_FACTOR, SCALE_DURATION)
