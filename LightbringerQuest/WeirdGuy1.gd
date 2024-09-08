extends KinematicBody2D
onready var grunt = $AudioStreamPlayer2D
onready var animatedSprite = $AnimatedSprite
var velocity = Vector2(0,0)
var goForward = true

func _ready():
	$AudioStreamPlayer2D.play()

func _physics_process(delta):
	if is_on_wall():
		animatedSprite.flip_h =not animatedSprite.flip_h
		goForward = not goForward
	if goForward == true:
		velocity.x = -40
	else:
		velocity.x = 40
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_Area2D_body_entered(body):
	if body.get_name() == "Sanctus":
		body.lose_HP()
		


func _on_Area2D_area_entered(area):
	if area.get_name() == "sanctusSword":
		queue_free()
