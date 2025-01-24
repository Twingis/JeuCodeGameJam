extends CollisionShape2D

@onready var front_ground: TileMapLayer = $"../.."
@onready var entered := false

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("entrer dans la zone")
	entered = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	print("sortie de la zone")
	entered = false
	
func _process(delta) :
	front_ground.visible = !entered
		
