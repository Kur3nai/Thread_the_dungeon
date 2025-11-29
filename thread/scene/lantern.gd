extends Node2D
class_name Lantern

@export_group("Floating Settings")
@export var float_distance: float = 50.0
@export var float_speed: float = 2.0

var is_collected: bool = false
var player: Node = null

func _ready():
	add_to_group("light")

func collect(player_node: Node):
	if is_collected:
		return
	
	# Check if player can collect more lanterns
	if player_node.has_method("get_lantern_count") and player_node.has_method("add_lantern"):
		var current_lanterns = player_node.get_lantern_count()
		var max_lanterns = player_node.max_lanterns
		
		if current_lanterns >= max_lanterns:
			return
		
		is_collected = true
		player = player_node
		
		# Remove from light group so it doesn't affect lighting
		remove_from_group("light")
		
		# Add to player's lantern collection
		player_node.add_lantern(self)

# Call this to release the lantern
func release():
	is_collected = false
	player = null
	
	# Add back to light group
	add_to_group("light")

func get_is_collected() -> bool:
	return is_collected
