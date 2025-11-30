extends Path2D

@export var loop = true
@export var speed = 2.0
@export var speed_scale = 1.0

@export var move_platform = false

@onready var path_follow_2d: PathFollow2D = $PathFollow2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	if not loop:
		animation_player.play("MovingPlatform")
		animation_player.speed_scale = speed_scale
		if not move_platform:
			animation_player.stop()
		set_process(false)

func _process(delta: float) -> void:
	if move_platform:
		path_follow_2d.progress += speed
