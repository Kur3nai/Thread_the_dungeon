extends CharacterBody2D

@onready var pick_up: Label = $pick_up
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var light_area:PointLight2D = $LightArea;
@onready var torch: Sprite2D = $Torch
var has_darkvision:bool = false;
@export var vision_radius:float = 8.0;
var vision_size:Vector2 = Vector2(vision_radius, vision_radius);
@export var vision_cooldown:float = 2.0;
@export var vision_reduction_speed:float = 3.0;

const SPEED = 300.0
const JUMP_VELOCITY = -450.0

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
	if has_darkvision:
		_activate_darkvision();
	
func _activate_darkvision():
	light_area.scale = vision_size;
	_darkvision_timer();

func _deactivate_darkvision():
	var tween = get_tree().create_tween()
	tween.tween_property(light_area, "scale", Vector2(1,1), 1.0) # 1 second fade-out
	tween.play()
	has_darkvision = false

func _darkvision_timer():
	var timer:Timer = Timer.new();
	add_child(timer)
	timer.wait_time = vision_cooldown;
	timer.one_shot = true;
	timer.start();
	timer.timeout.connect(_deactivate_darkvision);

func show_message(text):
	$pick_up.text = text
	$pick_up.show()

func hide_message():
	$pick_up.hide()
