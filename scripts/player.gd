extends CharacterBody2D


const SPEED = 120.0
const JUMP_VELOCITY = -250.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

const MAX_HEALTH := 100
const MAX_TIME := 20
var health := 50 # à changer plus tard

func _ready() :
	var timer: Timer = $Timer
	timer.wait_time = health * MAX_TIME / MAX_HEALTH
	timer.start()
	
func _on_timer_timeout():
	collision_shape.queue_free()
	# Engine.time_scale = 0.3
	print("no more time, player died")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction > 0 :
		animated_sprite.flip_h = true
	elif direction < 0:
		animated_sprite.flip_h = false
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()
