extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 25
var hook = preload("res://hook.tscn")
var listen_toggle = false

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
		
	if Input.is_action_just_pressed("listen"):
		if listen_toggle == true:
			listen_toggle = false
			$listenArea.set_monitoring(false)
			$listenArea/Particles2D.set_emitting(false)
			print(listen_toggle)
		
		elif listen_toggle == false:
			listen_toggle = true;
			print(listen_toggle)
			$listenArea.set_monitoring(true)
			$listenArea/Particles2D.set_emitting(true)
		
	if Input.is_action_just_pressed("cast"):
		var hook_inst = hook.instance()
		hook_inst.set_movement(direction)
		self.add_child(hook_inst)
		#hook_inst.move()

func _on_listenArea_area_entered(area):
	print("huh?")
