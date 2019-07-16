extends KinematicBody2D

var life = 100

var xvelocity = 30
var hitted = false

func _process(delta):
	$sprite.material = $sprite.material.duplicate()
	if !hitted:
		position.x -= xvelocity * delta
	else:
		position.x += xvelocity*2 * delta

func hit():
	life -= 60
	if life<0:
		self.queue_free()
	$sprite.material.shader = load("res://game_objects/shaders/alien.shader")
	$stun.start()
	hitted = true

func _on_stun_timeout():
	$sprite.material.shader = null
	hitted = false
