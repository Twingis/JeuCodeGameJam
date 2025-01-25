extends Node

var nombre_room : int 
# Called when the node enters the scene tree for the first time.
func reset():
	nombre_room = 0
	print("nbRoom reset")

func update_nombre_room():
	nombre_room += 1
	print("nbRoom update")

func get_nombre_room():
	return nombre_room
