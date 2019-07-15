extends KinematicBody2D

var pointer_pressed = Vector2()

func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT:
			if event.pressed:
				pointer_pressed = event.position
			else:
				throw_arrow(event.position)
	pass
	
func throw_arrow(pos):
	var arrow = preload("res://game_objects/arrow.tscn").instance()
	arrow.position = Vector2(155, 300) + position
	var dir = pos - pointer_pressed
	arrow.rotation = dir.angle()
	arrow.apply_impulse(dir)
	get_parent().add_child(arrow)