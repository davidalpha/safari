extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var water_tile_array = []
var trigger = preload("res://trigger.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	water_tile_array = get_cells_of_type($forestTileMap, 1)
	seed_triggers(water_tile_array, 14)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func get_cells_of_type(map, type):
	var all = map.get_used_cells()
	var cellsOfIndex = []
	for v in all:
		if map.get_cell(v.x, v.y) == type:
			cellsOfIndex.append(v)
	return cellsOfIndex

func seed_triggers(tile_array, amount):
	tile_array.shuffle()
	for i in range(0,amount):
		var trigger_instance = trigger.instance()
		var pos_in_px = Vector2($forestTileMap.map_to_world(tile_array[i]))
		trigger_instance.position = pos_in_px
		trigger_instance.position.x = (pos_in_px.x + $forestTileMap.cell_size.x / 2)
		trigger_instance.position.y = (pos_in_px.y + $forestTileMap.cell_size.y / 2)
		self.add_child(trigger_instance)
		
		

