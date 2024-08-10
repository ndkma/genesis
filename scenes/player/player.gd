extends CharacterBody2D

@export var speed = 400
@onready var plane_move_anim = $AnimatedSprite2D
@onready var engine_audio = $AudioStreamPlayer2D


func _ready():
	plane_move_anim.play("side")
	engine_audio.play()
	SignalManager.player_hit_by_meteor.connect(Callable(self, "die"))

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
	# Animation
	if input_direction.x > 0:
		plane_move_anim.flip_h = false
		plane_move_anim.play("side")
	elif input_direction.x < 0:
		plane_move_anim.flip_h = true
		plane_move_anim.play("side")

func _physics_process(delta):
	get_input()
	move_and_slide()
	
func die() -> void:
	set_physics_process(false)
	plane_move_anim.stop()
	engine_audio.stop()
	SignalManager.game_ended.emit()
	
