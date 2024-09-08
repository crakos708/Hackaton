extends Area2D



func _on_LevelCHange_body_entered(body):
	if body.get_name() == "Sanctus":
		get_tree().change_scene("res://Scenes/FinalBoss.tscn")
