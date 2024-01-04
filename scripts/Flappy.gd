extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
var jump_velocity = -400.0
var game_over: bool = false
var rotation_timer = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#if necesary set gravity to its own value
#example: var gravity = 980


func _ready():
	rotation = 0
	visible = false
	game_over = true
	anim.play("Flap")


func start_game():
	position.y = 324
	velocity.y = 0
	game_over = false
	visible = true


func end_game():
	game_over = true
	velocity.y = -700
	rotation += -20
	rotation_timer = 22


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if rotation_timer <= 1:
			rotation += 7 * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") && game_over == false:
		velocity.y = jump_velocity
		rotation += -20
		rotation_timer = 15


	if position.y >= 578 or position.y <= 82:
		if game_over == false:
			get_tree().call_group("end_game", "end_game")

	rotation_degrees = clampf(rotation_degrees, -60, 60)
	if rotation_timer != 0:
		rotation_timer -= 1

	move_and_slide()
