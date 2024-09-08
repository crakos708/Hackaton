extends KinematicBody2D

onready var animatedSprite = $AnimatedSprite
var velocity = Vector2(0,0)
var goForward = true

func _physics_process(delta):
	if is_on_wall():
		animatedSprite.flip_h =not animatedSprite.flip_h
		goForward = not goForward
	if goForward == true:
		velocity.x = -30
	else:
		velocity.x = 30
	velocity = move_and_slide(velocity, Vector2.UP)
