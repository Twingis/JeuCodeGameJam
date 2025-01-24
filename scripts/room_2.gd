extends Node2D

var notes_ramasses : Array = []


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_note_catch(note : Area2D) -> void:
	var healthBar = get_node("CanvasLayer/healthBar")
	notes_ramasses.append(note)
	healthBar.soigner(100)


func _on_texture_progress_bar_zéro() -> void:
	get_tree().change_scene_to_file("res://scenes/endMenu.tscn")
