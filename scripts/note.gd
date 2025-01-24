extends Area2D
signal catch(note : Area2D)

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
	$AnimatedSprite2D.play("note")
	sound = sounds[id]
	$AudioStreamPlayer.stream = sound
 
func playNote():
	$AudioStreamPlayer.play()


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D") :
		hide()
		emit_signal("catch", self)
		$CollisionShape2D.set_deferred("disabled", true)
		$AudioStreamPlayer.play()
