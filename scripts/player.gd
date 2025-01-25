extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -260.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

const MAX_HEALTH := 100
const MAX_TIME := 20
var health := 50 # à changer plus tard
var QTE = false

func _ready() :
	pass
	

func _physics_process(delta: float) -> void:
	if !QTE:
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("move_left", "move_right")
		
		if is_on_floor() :
			if direction == 0 :
				animated_sprite.play("idle")
			else :
				animated_sprite.play("run")
		else :
			animated_sprite.play("jump")
				
		if direction > 0 :
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true
			
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			

		move_and_slide()
	else:
		animated_sprite.play("idle")
		


func _on_zone_qte_qte_actif() -> void:
	QTE=true




func _on_zone_qte_qte_inactif() -> void:
	QTE = false


func _on_gateway_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
