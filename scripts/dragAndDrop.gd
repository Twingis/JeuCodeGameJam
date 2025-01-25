extends TextureRect

signal Clicked(note : AudioStreamPlayer)

static var  sounds: Array = [
	preload("res://assets/musics/95326__ramas26__a.mp3"),
	preload("res://assets/musics/95327__ramas26__b.mp3"),
	preload("res://assets/musics/95328__ramas26__c.mp3"),
	preload("res://assets/musics/95329__ramas26__d.mp3"),
	preload("res://assets/musics/95330__ramas26__e.mp3"),
	preload("res://assets/musics/95331__ramas26__f.mp3"),
	preload("res://assets/musics/95332__ramas26__g.mp3")
]

@export_range(0,6) var id : int
var sound
var is_drag_successful
var initial_position = Vector2() # Position initiale
var saveTexture

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sound = sounds[id]
	$AudioStreamPlayer.stream = sound
	is_drag_successful = false
	initial_position = position
	saveTexture = null


func changeID(newID : int )  -> void :
	id = newID
	sound = sounds[newID]
	$AudioStreamPlayer.stream = sound
	
func changeTexture(newTexture)  -> void :
	$".".texture = newTexture
	
func getId() -> int :
	return id
		
# Déclencher lorsque que l'on click et qu'on drag 
func _get_drag_data(at_position):
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(30,30)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	texture = null
	
	saveTexture = preview_texture.texture
	var data = [getId(), preview_texture.texture, at_position]
	print("Get drag data ")
	return data
	
# Déclencher lorsque on est au dessus d'une node (Button, Pane, TextureRect...) 
func _can_drop_data(at_position, data):
	print("is droppable")
	return data is Array
	
# Déclencher lorsqu'on lâche l'item dans une zone valide
func _drop_data(at_position, data):
	print("La data est déposée correctement")
	texture = data[1]
	var id = data[0]
	changeID(id)
	print(data)


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		emit_signal("Clicked", $AudioStreamPlayer)
		
func get_node_at_drag_position(at_position) -> TextureRect:
	var nodes_in_group = get_tree().get_nodes_in_group("droppable")  # Ajoutez vos TextureRect dans un groupe "droppable"
	for node in nodes_in_group:
		if node is TextureRect and node.get_global_rect().has_point(at_position):
			return node
	return null
