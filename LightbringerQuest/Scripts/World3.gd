extends Node2D

onready var introSound = $OST1
onready var sound2 = $OST2

func _ready():
	introSound.play()

func _on_OST1_finished():
	sound2.play()
