extends Node

var speed = 0
var list_notes : Array 
var melodie : Array
# Called when the node enters the scene tree for the first time.
func reset():
	list_notes = []
	melodie = []

func update_list_notes(note : int):
	list_notes.append(note)

func update_melodie(melo):
	melodie = melo

func addSpeed():
	speed+=60
