extends TextureProgressBar
signal zero

@export var speed : int

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value -= speed * delta
	Score.addScore()
	if value == 0:
		zero.emit()

func updateVitesse(new_speed):
	speed = new_speed
	
func soigner(valeur):
	value+=valeur
