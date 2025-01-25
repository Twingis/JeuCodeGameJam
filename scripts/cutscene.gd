extends Control

func _ready() -> void:
	$Bruitage.play()
	$Narration.play()
	
func _on_video_stream_player_finished() -> void:
	go_to_game()

func _on_skip_pressed() -> void:
	go_to_game()

func go_to_game() :
	var rand_room_num = randi_range(1,6)
	var path = "res://scenes/levels/random_level_"+str(rand_room_num)+".tscn"
	get_tree().change_scene_to_file(path)
