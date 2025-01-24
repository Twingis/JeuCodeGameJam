extends Area2D
signal catch

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("note")

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D") :
		hide()
		catch.emit()
		$CollisionShape2D.set_deferred("disabled", true)
