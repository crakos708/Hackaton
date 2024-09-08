extends Area2D
onready var pickupSound = $AudioStreamPlayer2D


func _on_Prism_body_entered(body):
	if body.get_name() == "Sanctus":
		body.add_Coin()
		queue_free()
