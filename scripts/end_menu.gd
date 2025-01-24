extends Control


func _on_replay_pressed() -> void:
	var rand_room_num = randi_range(1,2)
	var path = "res://scenes/levels/random_level_"+str(rand_room_num)+".tscn"
	get_tree().change_scene_to_file(path)


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
