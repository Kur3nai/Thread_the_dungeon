extends CharacterBody2D

@onready var pick_up: Label = $pick_up
@onready var torch: Sprite2D = $Light
@onready var animation_player: AnimationPlayer = $AnimationPlayer

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	torch.visible = true
	pick_up.visible = false
	animation_player.play("Torch")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("MoveLeft", "MoveRight")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func show_message(text):
	$pick_up.text = text
	$pick_up.show()

func hide_message():
	$pick_up.hide()
