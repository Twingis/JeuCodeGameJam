extends Node

var list_notes : Array 
var melodie : Array
# Called when the node enters the scene tree for the first time.
func reset():
	list_notes = []
	melodie = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_list_notes(note : int):
	list_notes.append(note)

func update_melodie(melo):
	melodie = melo
