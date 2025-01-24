extends TextureProgressBar

var vitesse = 1
signal zéro

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value -= 1*vitesse
	Score.addScore()
	if value==0:
		emit_signal("zéro")

func updateVitesse():
	vitesse+=1

func add(soin):
	value+=soin
