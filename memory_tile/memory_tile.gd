extends TextureButton
class_name MemoryTile
@onready var frame_image = $FrameImage
@onready var item_image = $ItemImage

var _item_name: String
var _is_selectable: bool = true
# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_selection_disabled.connect(on_selection_disabled)
	SignalManager.on_selection_enabled.connect(on_selection_enabled)

func get_item_name() -> String:
	return _item_name

func display_item(display: bool) -> void:
	frame_image.visible = display
	item_image.visible = display

func setup(item_image_dictionary: Dictionary, image: CompressedTexture2D) -> void:
	frame_image.texture = image
	item_image.texture = item_image_dictionary.item_texture
	_item_name = item_image_dictionary.item_name
	display_item(false)

func on_selection_disabled() -> void:
	_is_selectable = false

func on_selection_enabled() -> void:
	_is_selectable = true


func _on_pressed():
	if _is_selectable:
		SignalManager.on_tile_selected.emit(self)
