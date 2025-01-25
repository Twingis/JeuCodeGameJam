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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sound = sounds[id]
	$AudioStreamPlayer.stream = sound

func changeID(newID : int )  -> void :
	id = newID
	sound = sounds[newID]
	$AudioStreamPlayer.stream = sound
	
func changeTexture(newTexture)  -> void :
	$".".texture = newTexture
	
func getId() -> int :
	return id

func _get_drag_data(at_position):
	var preview_texture = TextureRect.new()
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(30,30)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	texture = null
	
	var data = [getId(), preview_texture.texture]
	return data
	
func _can_drop_data(at_position, data):
	return data is Array
	
func _drop_data(at_position, data):
	texture = data[1]
	id = data[0]
	changeID(id)
	print(data)

func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		emit_signal("Clicked", $AudioStreamPlayer)
		
