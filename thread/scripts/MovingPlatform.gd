extends Path2D

@export var loop = true
@export var speed = 2.0
@export var speed_scale = 1.0
@export var is_activated: bool = true:
	set = _set_activated
	
@onready var path_follow_2d: PathFollow2D = $PathFollow2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

# This function runs every time 'is_activated' changes
func _set_activated(new_value: bool):
	is_activated = new_value # Update the actual variable first
	if is_activated == true:
		# Call the movement function!
		start_movement()
		
func start_movement() -> void:
	if not loop:
		animation_player.play("move_platform")
		animation_player.speed_scale = speed_scale
		set_process(false)
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Just setting up the initial state, not starting the animation yet
	# Example: print("Platform is armed and waiting!")
	pass
		
