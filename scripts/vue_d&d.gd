extends Control

static var sounds = {
		0: load("res://assets/musics/95326__ramas26__a.mp3"),
		1: load("res://assets/musics/95327__ramas26__b.mp3"),
		2: load("res://assets/musics/95328__ramas26__c.mp3"),
		3: load("res://assets/musics/95329__ramas26__d.mp3"),
		4: load("res://assets/musics/95330__ramas26__e.mp3"),
		5: load("res://assets/musics/95331__ramas26__f.mp3"),
		6: load("res://assets/musics/95332__ramas26__g.mp3"),
	}
	
var sounds_list = []
var notes_list = Global.list_notes.duplicate(true)

	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var note_textures = {
		0: preload("res://assets/dragAndDropInterface/Notes/spriteNote_la.png"),
		1: preload("res://assets/dragAndDropInterface/Notes/spriteNote_si.png"),
		2: preload("res://assets/dragAndDropInterface/Notes/spriteNote_do.png"),
		3: preload("res://assets/dragAndDropInterface/Notes/spriteNote_re.png"),
		4: preload("res://assets/dragAndDropInterface/Notes/spriteNote_mi.png"),
		5: preload("res://assets/dragAndDropInterface/Notes/spriteNote_fa.png"),
		6: preload("res://assets/dragAndDropInterface/Notes/spriteNote_sol.png"),
	}
	
	print("liste notes global", Global.list_notes)
		
	for note in notes_list:
		sounds_list.append(sounds[note])
		
	print("notes liste avant pop", notes_list)
	
	var hbox = $MarginContainer/VBoxContainer/HBoxContainerNotesRamassee
	 # Parcourir les enfants du HBoxContainer et attribuer les textures
	for i in hbox.get_children():
		if i is TextureRect:  # Vérifie que l'enfant est un TextureRect
			var note_index = notes_list.pop_front() if notes_list.size() > 0 else null
			print(note_index)
			if note_index in note_textures:
				i.changeTexture(note_textures[note_index])
				i.changeID(note_index)
				
	print(Global.melodie)

func _on_listen_melody_pressed() -> void:
	play_melodie() # Replace with function body.


func play_melodie() -> void :
	var  sounds: Array = [
		preload("res://assets/musics/95326__ramas26__a.mp3"),
		preload("res://assets/musics/95327__ramas26__b.mp3"),
		preload("res://assets/musics/95328__ramas26__c.mp3"),
		preload("res://assets/musics/95329__ramas26__d.mp3"),
		preload("res://assets/musics/95330__ramas26__e.mp3"),
		preload("res://assets/musics/95331__ramas26__f.mp3"),
		preload("res://assets/musics/95332__ramas26__g.mp3")
	]
	
	var melodie = Global.melodie
	
	# Référence à l'AudioStreamPlayer existant dans la scène
	var audio_player = $AudioStreamPlayer # Remplacez par le chemin correct du nœud

	for note_index in melodie:
		if note_index >= 0 and note_index < sounds.size():  # Vérifie que l'index est valide
			# Change le son (stream) du lecteur
			audio_player.stream = sounds[note_index]
			
			# Joue le son
			audio_player.play()
			
			# Attendre 1 seconde avant de passer au suivant
			await get_tree().create_timer(0.8).timeout
			
			audio_player.stop()
	 # Joue le son


func _on_texture_rect_clicked(note: AudioStreamPlayer) -> void:
	note.play()


func _on_texture_rect_2_clicked(note: AudioStreamPlayer) -> void:
	note.play()


func _on_texture_rect_3_clicked(note: AudioStreamPlayer) -> void:
	note.play()


func _on_texture_rect_4_clicked(note: AudioStreamPlayer) -> void:
	note.play()


func _on_texture_rect_5_clicked(note: AudioStreamPlayer) -> void:
	note.play()


func _on_texture_rect_6_clicked(note: AudioStreamPlayer) -> void:
	note.play()


func _on_texture_rect_7_clicked(note: AudioStreamPlayer) -> void:
	note.play()


func _on_check_pressed() -> void:
	var list_recup_note = []
	var melodie = Global.melodie
	var hbox = $MarginContainer/VBoxContainer/Portee/HBoxContainer2
	 # Parcourir les enfants du HBoxContainer et attribuer les textures
	for i in hbox.get_children():
		if i is TextureRect:  # Vérifie que l'enfant est un TextureRect
			list_recup_note.append(i.getId())
	print(list_recup_note)
	print(melodie)
	if list_recup_note == melodie:
		var rand_room_num = randi_range(1,6)
		var path = "res://scenes/levels/random_level_"+str(rand_room_num)+".tscn"
		get_tree().change_scene_to_file(path)

func _process(delta: float) -> void:
	print("Global list notes",Global.list_notes)
	print("Notes Liste",notes_list)


func _on_reset_notes_pressed() -> void:
	print("reset moment",Global.list_notes)
	get_tree().change_scene_to_file("res://scenes/VueD&D.tscn")
