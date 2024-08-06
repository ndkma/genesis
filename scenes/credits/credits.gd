extends Control

const LevelManager = preload("res://singletons/level_manager.gd")


func _on_btn_back_pressed():
	get_tree().change_scene_to_file(LevelManager.MAIN_MENU_SCENE)
