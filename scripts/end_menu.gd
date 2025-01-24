extends Control


func _on_replay_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Room1.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
