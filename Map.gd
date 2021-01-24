extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var water_tile_array = []
var weeds_tile_array = []
var trigger = preload("res://trigger.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	water_tile_array = $water.get_used_cells()
	weeds_tile_array = $weeds.get_used_cells()
	seed_triggers($water, water_tile_array, 10)
	seed_triggers($weeds, weeds_tile_array, 10)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func seed_triggers(map, tile_array, amount):
	tile_array.shuffle()
	for i in range(0,amount):
		var trigger_instance = trigger.instance()
		var pos_in_px = Vector2(map.map_to_world(tile_array[i]))
		trigger_instance.position = pos_in_px
		trigger_instance.position.x = (pos_in_px.x + map.cell_size.x / 2)
		trigger_instance.position.y = (pos_in_px.y + map.cell_size.y / 2)
		self.add_child(trigger_instance)
		
		

