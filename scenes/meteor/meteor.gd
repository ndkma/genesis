extends Area2D

var direction:Vector2 = Vector2(randf_range(0, 1.0), randf_range(0, 1.0))
@export var speed: float = 200.0

func _ready():
	# remove meteors from the scene after 10 seconds for those meteors
	# that aren't removed by _on_screen_exited() below (i.e those that never
	# actually enter the screen and would then live forever)
	await get_tree().create_timer(10).timeout
	queue_free()
	print("meteor despawned: timeout")

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("hit emitted!")
		SignalManager.player_hit_by_meteor.emit()

func _process(delta: float) -> void:
	position += direction.normalized() * speed * delta

func _on_screen_exited():
	queue_free()
	print("meteor despawned: offscreen")
