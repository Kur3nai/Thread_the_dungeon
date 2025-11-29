extends Path2D

@export var loop = true
@export var speed = 2.0
@export var speed_scale = 1.0

# Export move_platform variable
@export var move_platform = true

@onready var path_follow_2d: PathFollow2D = $PathFollow2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not loop:
		animation_player.play("MovingPlatform")
		animation_player.speed_scale = speed_scale
		# Even if it's an animation, we might want it to wait!
		if not move_platform:
			animation_player.stop()
		set_process(false)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# If move_platform is set to be true
	if move_platform:
		path_follow_2d.progress += speed
