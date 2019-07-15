extends Node2D

# Movement vars
var MOVEMENT_LIMIT = 60
var MOVEMENT_VELOCITY = 150

func _process(delta):
	var ymovement = 0
	if Input.is_action_pressed("pl_up"):
		ymovement -= 1
	if Input.is_action_pressed("pl_down"):
		ymovement += 1
		
	if ymovement != 0:
		move_in_perspective_y($player, ymovement * MOVEMENT_VELOCITY * delta)
	


func move_in_perspective_y(obj, x):
	var movement = obj.position + Vector2(desviation(x), x)
	if( abs(movement.y) >= MOVEMENT_LIMIT):
		return
	else:
		obj.position = movement
func desviation(x):
	return -(0.85)*x

func add_alien():
	var alien = preload("res://game_objects/alien.tscn").instance()
	add_child(alien)
	alien.position = Vector2(400,-50)
	move_in_perspective_y(alien, 40*int(rand_range(0,3)))
	
func _on_spawn_timeout():
	add_alien()
