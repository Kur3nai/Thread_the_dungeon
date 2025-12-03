extends Node2D

enum RuneType {HAS_DARKVISION, INCREASE_SPEED, INCREASE_JUMP, INCREASE_VISION_RADIUS}

@export var rune_type: RuneType = RuneType.HAS_DARKVISION
@export var speed_increase: int = 0
@export var jump_increase: int = 0
@export var vision_increase: float = 0
@export var duration: float = 0
var player:Node2D;
@onready var light_area: PointLight2D = $LightArea


func _on_pickup_range_entered(body: Node2D):
	if body.is_in_group("ShadyX"):
		player = body
		start_timer();
		match rune_type:
			RuneType.HAS_DARKVISION:
				Global.Has_Darkvision = true
			RuneType.INCREASE_SPEED:
				Global.Speed += speed_increase
			RuneType.INCREASE_JUMP:
				Global.Jump_Velocity -= jump_increase
			RuneType.INCREASE_VISION_RADIUS:
				body.vision_radius += vision_increase
				if Global.Has_Darkvision:
					body.vision_size = Vector2(body.vision_radius, body.vision_radius)
		self.visible = false;


#timer not working yet
func start_timer():
	await get_tree().create_timer(duration).timeout
	print("Time out!")
	revert_effect(player)

func revert_effect(body):
	match rune_type:
		RuneType.HAS_DARKVISION:
			Global.Has_Darkvision = false
		RuneType.INCREASE_SPEED:
			Global.Speed = Global.base_speed;
		RuneType.INCREASE_JUMP:
			Global.Jump_Velocity = Global.base_jump_velocity;
		RuneType.INCREASE_VISION_RADIUS:
			body.vision_radius = body.base_vision_radius;
			if Global.Has_Darkvision:
				body.vision_size = Vector2(body.vision_radius, body.vision_radius)
	queue_free();

func _process(delta: float) -> void:
	if Global.letter_visible:
		light_area.visible = false
	else:
		light_area.visible = true
