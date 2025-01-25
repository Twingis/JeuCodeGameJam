extends Node2D
signal reussi
signal perdu

var required_inputs: Array = ["A_key", "Z_key", "E_key", "R_key"]
var current_input_index: int = 0
var time_limit: float = 2.0

var active : bool = false

var action_to_texture: Dictionary = {
	"A_key": preload("res://assets/Keyboard & Mouse/Default/keyboard_a.png"),
	"Z_key": preload("res://assets/Keyboard & Mouse/Default/keyboard_z.png"),
	"E_key": preload("res://assets/Keyboard & Mouse/Default/keyboard_e.png"),
	"R_key": preload("res://assets/Keyboard & Mouse/Default/keyboard_r.png")
}


@onready var instructions_label: Label = $Instructions
@onready var feedback_label: Label = $Retour
@onready var timer: Timer = $QTETimer
@onready var instructions_images : TextureRect = $InstructionsImages


func start_qte() -> void:
	active = true
	current_input_index = 0
	feedback_label.text = ""
	update_instructions()
	start_timer()


func update_instructions() -> void:
	if current_input_index < required_inputs.size():
		var current_action = required_inputs[current_input_index]
		instructions_images.texture = action_to_texture.get(current_action, null)
		instructions_label.text = "Appuie sur : " + required_inputs[current_input_index].replace("ui_", "").capitalize()
	else:
		instructions_images.texture = null
		instructions_label.text = "QTE Complété !"

func start_timer() -> void:
	timer.wait_time = time_limit
	timer.start()


func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed() and active:
		var expected_action = required_inputs[current_input_index]
		if InputMap.action_has_event(expected_action, event):
			current_input_index += 1
			feedback_label.text = "Correct !"
			if current_input_index < required_inputs.size():
				update_instructions()
				start_timer()
			else:
				feedback_label.text = "QTE Réussi !"
				active = false
				reussi.emit()
				timer.stop()
		else:
			feedback_label.text = "Échec !"
			current_input_index = 0
			update_instructions()
			perdu.emit()
			timer.stop()

func _on_QTE_Timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/endMenu.tscn")
	
