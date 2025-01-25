extends Area2D

@export var scene: PackedScene
var entered = false


func _on_body_entered(body: PhysicsBody2D):
	Global.addSpeed()
	var rand_room_num = randi_range(1,6)
	var path = "res://scenes/levels/random_level_"+str(rand_room_num)+".tscn"
	get_tree().change_scene_to_file(path)


func _on_body_exited(body):
	print("sortie de la zone")
	entered = false
