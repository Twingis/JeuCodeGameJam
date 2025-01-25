extends AnimatedSprite2D

@onready var animated_sprite: AnimatedSprite2D = $"."
@onready var collision_shape: CollisionShape2D = $"../CollisionShape2D"

var QTE = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if !QTE:
		animated_sprite.play("stay")
	


func _on_zone_qte_qte_actif() -> void:
	QTE=true
	animated_sprite.play("throw")


func _on_zone_qte_qte_inactif() -> void:
	collision_shape.disabled = true
