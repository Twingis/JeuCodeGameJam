extends Control

func _on_play_pressed() -> void:
	NbRoom.reset()
	NbRoom.update_nombre_room()
	get_tree().change_scene_to_file("res://scenes/cutscene.tscn")

func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutoriel.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/optionsMenu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
	


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
