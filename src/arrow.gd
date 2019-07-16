extends KinematicBody2D

var section = 0

var gravity = Vector2(0, 400)
var velocity = Vector2(0,0)
var stop = false

func _ready():
	section = int(position.y - 240) / 40
	
func _process(delta):
	if !stop:
		velocity += gravity * delta
		rotation = velocity.angle()
		position += velocity * delta
		if position.y > 300 + 40*section && velocity.y > 0:
			print(velocity.length())
			if velocity.angle() < 0.6 && velocity.length() > 30:
				velocity = velocity.bounce(Vector2(0,-1)) * 0.7
			else:
				stop()
	
func apply_impulse(impulse):
	velocity += impulse

func _on_head_body_entered(body):
	if body.is_in_group("sector"+str(section)):
		if body.has_method("hit") && !stop:
			body.hit()
			stop()
			#get_parent().remove_child(self)
			#body.add_child(self)

func stop():
	stop = true
	$die_time.start()

func _on_die_time_timeout():
	self.queue_free()
