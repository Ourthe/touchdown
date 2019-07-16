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
	var dir = pointer_pressed - pos
	arrow.rotation = dir.angle()
	arrow.apply_impulse(dir)
	get_parent().add_child(arrow)

func _on_vulnerable_body_entered(body):
	var sector = int(position.y + 60)/40
	if body.is_in_group("sector"+str(sector)):
		print("moriste en sector " + str(sector))
		get_tree().change_scene("res://scenes/game_over.tscn")
