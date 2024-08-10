extends Node2D

const GAME_OVER = preload("res://scenes/game_ui/game_over/game_over.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.game_ended.connect(Callable(self, "show_game_over"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_game_over():
	var game_over_screen = GAME_OVER.instantiate()
	add_child(game_over_screen)
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file(LevelManager.MAIN_MENU_SCENE)
	
