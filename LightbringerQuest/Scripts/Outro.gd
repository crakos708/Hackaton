extends Node2D



func _on_VideoPlayer_finished():
	get_tree().change_scene("res://Scenes/Credits.tscn")
