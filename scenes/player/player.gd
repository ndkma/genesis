extends CharacterBody2D

@export var speed = 400
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var audio_stream_player_2d = $AudioStreamPlayer2D


func _ready():
	animated_sprite_2d.play("side")
	audio_stream_player_2d.play()

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
	# Animation
	if input_direction.x > 0:
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play("side")
	elif input_direction.x < 0:
		animated_sprite_2d.flip_h = true
		animated_sprite_2d.play("side")

func _physics_process(delta):
	get_input()
	move_and_slide()
