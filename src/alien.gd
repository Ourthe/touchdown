extends KinematicBody2D

var xvelocity = 30

# Called when the node enters the scene tree for the first time.
func _process(delta):
	position.x -= xvelocity * delta