extends Control

func _on_play_pressed() -> void:
	var rand_room_num = randi_range(1,2)
	var path = "res://scenes/levels/random_level_"+str(rand_room_num)+".tscn"
	get_tree().change_scene_to_file(path)

func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutoriel.tscn")

func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/optionsMenu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
	
