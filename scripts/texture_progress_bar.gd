extends TextureProgressBar
signal zero

var vitesse = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value -= 1*vitesse
	Score.addScore()
	if value == 0:
		zero.emit()

func updateVitesse(newVitesse):
	vitesse = newVitesse
	
func soigner(valeur):
	value+=valeur
