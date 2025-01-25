extends Control

func _ready() -> void:
	$Bruitage.play()
	$Narration.play()
	
func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/random_level_1.tscn")


func _on_skip_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/random_level_1.tscn")
