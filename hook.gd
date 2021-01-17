extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var direction = 0
export var speed = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func set_movement(movement_vector):
	direction = movement_vector
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_collide(direction * speed * delta)
