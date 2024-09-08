extends KinematicBody2D
onready var bossSound = $AudioStreamPlayer2D
var PumpkinHP = 5

func _on_Area2D_body_entered(body):
	if body.get_name() == "Sanctus":
		body.lose_HP()
		not bossSound.play()


func _on_Area2D_area_entered(area):
	if area.get_name() == "sanctusSword":
		PumpkinHP -= 1
		if PumpkinHP == 0:
			$AnimatedSprite.play("Umbrarum")
		if PumpkinHP < 0:
			get_tree().change_scene("res://Scenes/Outro.tscn")
		
