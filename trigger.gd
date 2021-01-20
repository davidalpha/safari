extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player_listen_area = get_node("Game/Player/listen_area")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_SplashArea_body_entered(player_listen_area):
	$SplashArea/splash_particle/Particles2D.set_emitting(true)
