extends Control

var list_scenes = [
	"res://scenes/levels/random_level_1.tscn",
	"res://scenes/levels/random_level_2.tscn",
	"res://scenes/levels/random_level_3.tscn",
	"res://scenes/levels/random_level_4.tscn",
	"res://scenes/levels/random_level_5.tscn",
	"res://scenes/levels/random_level_7.tscn",
]

func _on_replay_pressed() -> void:
	NbRoom.reset()
	NbRoom.update_nombre_room()
	var next_scene = list_scenes[randi()%list_scenes.size()-1]
	get_tree().change_scene_to_file(next_scene)


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
