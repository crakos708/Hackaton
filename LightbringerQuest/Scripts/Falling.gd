extends Area2D

func _on_Area2D_body_entered(body):
	if body.get_name() == "Sanctus":
		get_tree().reload_current_scene()
