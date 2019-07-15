extends KinematicBody2D

var section = 0

var gravity = Vector2(0, 400)
var velocity = Vector2(0,0)

func _ready():
	section = int(position.y - 240) / 40
	
func _process(delta):
	velocity += gravity * delta
	rotation = velocity.angle()
	position += velocity * delta
	if position.y > 300 + 40*section && velocity.y > 0:
		velocity = velocity.bounce(Vector2(0,-1))
	
func apply_impulse(impulse):
	velocity += impulse