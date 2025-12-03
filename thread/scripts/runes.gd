extends Node2D

enum RuneType {HAS_DARKVISION, INCREASE_SPEED, INCREASE_JUMP, INCREASE_VISION_RADIUS}
@export var rune_type: RuneType = RuneType.HAS_DARKVISION
@export var speed_increase: int = 50
@export var jump_increase: int = -100
@export var vision_increase: float = 5.0
@onready var light_area: PointLight2D = $LightArea

func _on_pickup_range_entered(body: Node2D):
	if(body.is_in_group("ShadyX")):
		match rune_type: 
			RuneType.HAS_DARKVISION:
				Global.Has_Darkvision = true
			RuneType.INCREASE_SPEED:
				Global.Speed += 50
			RuneType.INCREASE_JUMP:
				Global.Jump_Velocity -= 100
			RuneType.INCREASE_VISION_RADIUS:
				body.vision_radius += 5
				if Global.Has_Darkvision: 
					body.vision_size = Vector2(body.vision_radius, body.vision_radius)
		queue_free()

func _process(delta: float) -> void:
	if Global.letter_visible:
		light_area.visible = false;
	else:
		light_area.visible = true;
