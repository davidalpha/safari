extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 25
onready var sprite = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	# Get player input
	var direction: Vector2
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# If input is digital, normalize it for diagonal movement
	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()
		
	
	# Apply movement
	var movement = speed * direction * delta
	move_and_collide(movement)
	
	# sprite direction
	if direction.x < 0:
		$AnimatedSprite.play("duckWalkLeft")
		#$AnimatedSprites.flip_h = false
	elif direction.x > 0:
		$AnimatedSprite.play("duckWalkRight")
		#$AnimatedSprites.flip_h = false
		
	elif direction.x == 0: 
		$AnimatedSprite.stop()
		
	if Input.is_action_pressed("castRod"):
		$AnimatedSprite.visible = 1
		$Sprite.visible = 0
		if direction.y < 0:
			$AnimatedSprite.play("fishUp")
		elif direction.y > 0:
			$AnimatedSprite.play("fishDown")
