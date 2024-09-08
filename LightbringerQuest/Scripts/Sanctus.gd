extends KinematicBody2D
onready var walkSound = $Walk
onready var pickupSound = $Pickup
onready var hitSound = $swordClang
onready var jumpSound = $Jump
onready var sanctusHitSound = $Hit
onready var HPNumber = get_tree().get_root().find_node("CanvasLayer", true, false)
onready var HPNumber2 = get_tree().get_root().find_node("CanvasLayer2", true, false)
var speed = 175
var gravity = 1250
var jumpHeight = 425
var movement = Vector2.ZERO
var attack = false

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
onready var animatedSprite = $AnimatedSprite

func _physics_process(delta):
	movement.y += gravity * delta
	movement = move_and_slide(movement,Vector2.UP)
	
	if Input.is_action_pressed("Attack"):
		animatedSprite.play("Attack")
		attack = true

	if Input.is_action_just_pressed("ui_accept"):
		animatedSprite.play("Jump")
		jumpSound.play()
		
		
		if is_on_floor() && attack == false:
			movement.y =-jumpHeight
			if not jumpSound.is_playing():
				jumpSound.play()    
	
	movement.x = 0
	if Input.is_action_pressed("ui_right") && attack == false:
		movement.x += speed
		animatedSprite.flip_h = false
		animatedSprite.play("Walk")
		if not walkSound.is_playing() && is_on_floor():
				walkSound.play()
				
	elif Input.is_action_pressed("ui_left") && attack == false:
		movement.x -= speed
		animatedSprite.flip_h = true
		animatedSprite.play("Walk")
		if not walkSound.is_playing() && is_on_floor():
				walkSound.play()

	elif attack == false:
		animatedSprite.play("Idle")
	

func add_Coin():
	var canvasLayer = get_tree().get_root().find_node("CanvasLayer",true,false)
	var canvasLayer2 = get_tree().get_root().find_node("CanvasLayer2",true,false)
	pickupSound.play()
	
	canvasLayer.handlePrismCollected()
	canvasLayer2.handlePrismCollected()
func lose_HP():
	var HP = get_tree().get_root().find_node("CanvasLayer", true, false)
	var HP2 = get_tree().get_root().find_node("CanvasLayer2", true, false)
	
	HP.handleHPNumber()
	HP2.handleHPNumber()
	if HPNumber.hpNumber < 5:
		if not sanctusHitSound.is_playing():
			sanctusHitSound.play()
	if HPNumber.hpNumber < 0:
		get_tree().change_scene("res://Scenes/GameOver.tscn")



func _on_AnimatedSprite_animation_finished():
	if animatedSprite.animation == "Attack":
			animatedSprite.play ("Idle")
			hitSound.play()
			attack = false

	


func _on_AnimatedSprite_frame_changed():
	if animatedSprite.animation == "Attack":
		$sanctusSword/CollisionShape2D.disabled = false
	else:
		$sanctusSword/CollisionShape2D.disabled = true

