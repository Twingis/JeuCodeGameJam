extends TextureProgressBar

signal zéro
var vitesse = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value -= 1*vitesse
	if value==0:
		emit_signal("zéro")

func add(soin):
	value+=soin

func updateVitesse():
	vitesse+=1
