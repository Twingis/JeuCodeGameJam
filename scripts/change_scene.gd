extends Area2D

@export var scene: PackedScene
var entered = false

func _on_body_entered(body: PhysicsBody2D):
	print("entrer dans la zone")
	entered = true


func _on_body_exited(body):
	print("sortie de la zone")
	entered = false

func _process(delta) :
	if entered == true:
		if Input.is_key_pressed(KEY_E):
			print("changement de scène")
			get_tree().change_scene_to_file("res://scenes/Room2.tscn")
