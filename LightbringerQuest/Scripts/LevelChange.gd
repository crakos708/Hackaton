extends Area2D


func _on_LevelChange_body_entered(body):
	if body.get_name() == "Sanctus":
		get_tree().change_scene("res://Scenes/World2.tscn")
