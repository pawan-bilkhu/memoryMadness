extends Node

const FRAME_IMAGES: Array = [
	preload("res://assets/frames/blue_frame.png"),
	preload("res://assets/frames/green_frame.png"),
	preload("res://assets/frames/red_frame.png"),
	preload("res://assets/frames/yellow_frame.png")
]

var _item_images: Array = []
# Called when the node enters the scene tree for the first time.
func _ready():
	load_item_images()


func add_file_to_list(file_name: String, path: String) -> void:
	var absolute_path = path + "/" + file_name
	var item_details =  {
		"item_name": file_name.rstrip(".png"),
		"item_texture": load(absolute_path)
	}
	_item_images.append(item_details)

func load_item_images() -> void:
	var path = "res://assets/glitch"
	var directory = DirAccess.open(path)
	
	if not directory:
		print("Error: ", path)
		return
	
	var file_names = directory.get_files()
	# print(file_names)
	for file in file_names:
		if ".import" not in file:
			# print(file)
			add_file_to_list(file, path)
	# print("loaded: ", _item_images.size())

func get_random_item_image() -> Dictionary:
	return _item_images.pick_random()
	
func get_item_image(index: int) -> Dictionary:
	return _item_images[index]

func get_random_frame_image() -> CompressedTexture2D:
	return FRAME_IMAGES.pick_random()

func shuffle_item_images() -> void:
	_item_images.shuffle()
