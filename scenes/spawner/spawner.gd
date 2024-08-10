extends Node2D

const METEOR = preload("res://scenes/meteor/meteor.tscn")
@onready var timer = $Timer

func spawn_meteor() -> void:
	var meteor = METEOR.instantiate()
	add_child(meteor)	

func _on_timer_timeout():
	spawn_meteor()
