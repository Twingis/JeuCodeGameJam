extends Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_note_catch() -> void:
	var healthBar = get_node("CharacterBody2D/Camera2D/TextureProgressBar")
	healthBar.add(100)

func _on_texture_progress_bar_zéro() -> void:
	get_tree().change_scene_to_file("res://scenes/endMenu.tscn")
