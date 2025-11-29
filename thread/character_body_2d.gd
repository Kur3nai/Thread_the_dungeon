extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export_group("Lantern Settings")
@export var max_lanterns: int = 3
@export var float_distance: float = 50.0
@export var interact_range: float = 80.0

var collected_lanterns: Array = []
var gravity: float = 980.0
var nearby_lanterns: Array = []

func _ready():
	# Add any initialization code here
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	# Update lantern positions each frame
	update_lantern_positions(delta)
	
	# Check for nearby lanterns
	check_nearby_lanterns()

func _input(event):
	# Handle interact input
	if event.is_action_pressed("interact"):
		try_pickup_lantern()

func check_nearby_lanterns():
	nearby_lanterns.clear()
	var all_lanterns = get_tree().get_nodes_in_group("light")
	
	for lantern in all_lanterns:
		if is_instance_valid(lantern) and lantern.has_method("get_is_collected") and not lantern.get_is_collected():
			var distance_to_lantern = global_position.distance_to(lantern.global_position)
			if distance_to_lantern <= interact_range:
				nearby_lanterns.append(lantern)

func try_pickup_lantern():
	if nearby_lanterns.size() > 0:
		# Pick the closest lantern
		var closest_lantern = null
		var closest_distance = interact_range
		
		for lantern in nearby_lanterns:
			var distance = global_position.distance_to(lantern.global_position)
			if distance < closest_distance:
				closest_distance = distance
				closest_lantern = lantern
		
		if closest_lantern and closest_lantern.has_method("collect"):
			closest_lantern.collect(self)

func add_lantern(lantern: Node) -> bool:
	if collected_lanterns.size() >= max_lanterns:
		return false
	
	collected_lanterns.append(lantern)
	update_lantern_positions(0)
	return true

func remove_lantern(lantern: Node):
	collected_lanterns.erase(lantern)
	update_lantern_positions(0)

func get_lantern_count() -> int:
	return collected_lanterns.size()

func update_lantern_positions(delta: float):
	for i in collected_lanterns.size():
		var lantern = collected_lanterns[i]
		if is_instance_valid(lantern):
			# Calculate orbit position
			var angle = TAU * (float(i) / max_lanterns) + Time.get_time_dict_from_system().second
			var target_position = global_position + Vector2(
				cos(angle) * float_distance,
				sin(angle) * float_distance
			)
			
			# Smooth movement towards orbit position
			lantern.global_position = lantern.global_position.lerp(target_position, 5.0 * delta)
			
			# Optional: Add slight bobbing effect
			var bob_offset = sin(Time.get_ticks_msec() * 0.005 + i) * 3.0
			lantern.global_position.y += bob_offset * delta

# Optional: Release all lanterns (for death, respawn, etc.)
func release_all_lanterns():
	for lantern in collected_lanterns:
		if is_instance_valid(lantern) and lantern.has_method("release"):
			lantern.release()
	collected_lanterns.clear()

# Optional: Show interact prompt when near lanterns
func is_near_lantern() -> bool:
	return nearby_lanterns.size() > 0
	
