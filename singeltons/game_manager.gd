extends Node

const GROUP_TILE: String = "tile"
# -- game_manager -- #

const LEVELS: Dictionary = {
	1: { "rows": 2, "cols": 2 },
	2: { "rows": 3, "cols": 4 },
	3: { "rows": 4, "cols": 4 },
	4: { "rows": 4, "cols": 6 },
	5: { "rows": 5, "cols": 6 },
	6: { "rows": 6, "cols": 6 }
}

func get_level_selection(level_number: int) -> Dictionary:
	var level_data = LEVELS[level_number]
	var tile_amount = level_data.rows * level_data.cols
	var target_pairs: int = tile_amount/2
	var selected_level_images = []
	ImageManager.shuffle_item_images()
	
	for i in range(target_pairs):
		selected_level_images.append(ImageManager.get_item_image(i))
		selected_level_images.append(ImageManager.get_item_image(i))
	
	selected_level_images.shuffle()
	return {
		"target_pairs": target_pairs,
		"cols_quantity": level_data.cols,
		"image_list": selected_level_images
	}

func remove_node_group(group_name: String) -> void:
	for node in get_tree().get_nodes_in_group(group_name):
		node.queue_free()
