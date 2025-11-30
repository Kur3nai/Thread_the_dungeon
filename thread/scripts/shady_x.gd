extends CharacterBody2D

@onready var pick_up: Label = $pick_up
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var torch: Sprite2D = $Torch
@onready var sprite_2d: Sprite2D = $Sprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	torch.visible = false
	pick_up.visible = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("MoveLeft", "MoveRight")
	
	if direction > 0:
		sprite_2d.flip_h = false
	elif direction < 0:
		sprite_2d.flip_h = true

	if is_on_floor():
		if direction == 0:
			animation_player.play("Idle")
		else: 
			animation_player.play("Walking")
	else: 
		animation_player.play("Jumping")
	
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
