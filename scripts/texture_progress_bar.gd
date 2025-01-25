extends TextureProgressBar
signal zero

var speed = 120

var active = false

func _ready() -> void:
	$Timer.start(6.5)  # Démarre le timer
	await $Timer.timeout
	active = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if active :
		value -= speed * delta
		Score.addScore()
		if value == 0:
			zero.emit()

func updateVitesse():
	speed += Global.speed
	
func soigner(valeur):
	value+=valeur
