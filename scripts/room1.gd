extends Node2D

var notes_ramasses : Array = []
var melody : Array = [5,4,2,0,6,1,3]
var notes_sorted = []



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _ready() -> void:
	for note in melody :
		if note == null :
			print("il y a une note null")


func _on_note_catch(note : Area2D) -> void:
	print("note ramassés")
	var healthBar = get_node("CanvasLayer/healthBar")
	notes_ramasses.append(note)
	healthBar.soigner(100)


func _on_texture_progress_bar_zéro() -> void:
	get_tree().change_scene_to_file("res://scenes/endMenu.tscn")
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if notes_ramasses.size() < melody.size() :
		$Label.text = "Vous n'avez pas toutes les notes"
	else :
		$Label.text = ""
		notes_sorted = tri_notes(notes_ramasses, melody)
		await play_notes_with_delay(notes_sorted, 0.5)  # 0.5 secondes entre chaque note

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
	
