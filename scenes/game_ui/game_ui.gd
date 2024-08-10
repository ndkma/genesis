extends Control

@onready var game_over = $GameOver


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.player_hit_by_meteor.connect(Callable(self, show_game_over()))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_game_over():
	game_over.toggle_visibility()
