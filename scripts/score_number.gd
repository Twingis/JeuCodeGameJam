extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = str(Score.score)
	Score.resetScore()
