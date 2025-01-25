extends Node2D

var notes_ramasses : Array = []
var melody : Array = [0,1,2,3,4,5,6]
var notes_sorted = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if notes_ramasses.size() < melody.size() :
		$Label.text = "Tu n'as pas aidé toutes les notes :("
	else :
		$Label.text = "Dépèche toi de sortir !"

func _ready() -> void:
	notes_ramasses = []
	for note in melody :
		if note == null :
			print("il y a une note null")
	melody.shuffle()


func _on_note_catch(note : Area2D) -> void:
	print("note ramassés")
	var healthBar = get_node("CanvasLayer/healthBar")
	notes_ramasses.append(note)
	healthBar.soigner(100)

func _on_texture_progress_bar_zéro() -> void:
	get_tree().change_scene_to_file("res://scenes/endMenu.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if notes_ramasses.size() >= melody.size() :
		print(notes_ramasses)
		for note in notes_ramasses:
			Global.update_list_notes(note.id)
		Global.update_melodie(melody)

		get_tree().change_scene_to_file("res://scenes/VueD&D.tscn")

		

# Fonction pour jouer les notes avec un délai
func play_notes_with_delay(notes_sorted: Array, delay: float) -> void:
	var timer = $Timer
	for note in notes_sorted:
		note.playNote()  # Joue la note
		$Timer.start(delay)  # Démarre le timer
		await $Timer.timeout  # Attend la fin du timer avant de continuer

func tri_notes(tab : Array, model : Array) -> Array :
	var sort = []
	for element in model :
		sort.append(tab[element])
	return sort
