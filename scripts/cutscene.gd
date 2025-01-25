extends Control

var list_scenes = [
	"res://scenes/levels/random_level_1.tscn",
	"res://scenes/levels/random_level_2.tscn",
	"res://scenes/levels/random_level_3.tscn",
	"res://scenes/levels/random_level_4.tscn",
	"res://scenes/levels/random_level_5.tscn",
	"res://scenes/levels/random_level_7.tscn",
]

func _ready() -> void:
	$Bruitage.play()
	$Narration.play()
	
func _on_video_stream_player_finished() -> void:
	go_to_game()

func _on_skip_pressed() -> void:
	go_to_game()

func go_to_game() :
	var next_scene = list_scenes[randi()%list_scenes.size()-1]
	get_tree().change_scene_to_file(next_scene)
