extends Area2D

signal smallPrismCollected

func _on_SmallPrism_body_entered(body):
	emit_signal("smallPrismCollected")
	queue_free()
