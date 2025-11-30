extends Path2D

@export var loop = false
@export var speed = 2.0
@export var speed_scale = 1.0

# Export move_platform variable
@export var move_platform = false

@onready var path_follow_2d: PathFollow2D = $PathFollow2D
@onready var end_point_sound: AudioStreamPlayer2D = $OpeningBell421471

func _ready() -> void:
	# Sync the Godot node setting with our script variable
	path_follow_2d.loop = loop

func _process(delta: float) -> void:
	if move_platform:
		# 1. Snapshot where we are before moving
		var pre_move_ratio = path_follow_2d.progress_ratio
		
		# 2. Move the platform
		path_follow_2d.progress += speed
		
		# 3. Snapshot where we are after moving
		var current_ratio = path_follow_2d.progress_ratio
		
		# --- SOUND & STOP LOGIC ---
		
		if loop:
			# If looping: Check if we wrapped around (Ratio went from 0.99 -> 0.01)
			if current_ratio < pre_move_ratio and speed > 0:
				play_sound()
		else:
			# If NOT looping: Check if we just hit the end (1.0)
			# The PathFollow2D node automatically clamps at 1.0 if loop is false
			if current_ratio >= 1.0 and pre_move_ratio < 1.0:
				play_sound()
				move_platform = false # Stop the engine!
				print("Destination reached. Stopping.")

func play_sound() -> void:
	if not end_point_sound.playing:
		end_point_sound.play()

func start_moving() -> void:
	# If we are stuck at the end and want to go again, reset to start!
	if path_follow_2d.progress_ratio >= 1.0 and not loop:
		path_follow_2d.progress_ratio = 0.0
		move_platform = true
