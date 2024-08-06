extends Control

const LevelManager = preload("res://singletons/level_manager.gd")

# ==========Menu Buttons===========
func _on_btn_play_pressed():
	get_tree().change_scene_to_file(LevelManager.GAME_LEVEL_ONE_SCENE)

func _on_btn_credits_pressed():
	get_tree().change_scene_to_file(LevelManager.CREDITS_SCENE)

func _on_btn_quit_pressed():
	get_tree().quit()
# ================================

