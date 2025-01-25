extends CollisionShape2D

@onready var entered = false
@onready var front_ground: TileMapLayer = $"../.."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	front_ground.visible = !entered


func _on_area_2d_body_entered(body: Node2D) -> void:
	entered = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	entered = false
