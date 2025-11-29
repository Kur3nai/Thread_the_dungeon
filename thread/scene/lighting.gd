extends ColorRect
class_name lighting

func _ready():
	show()

func _process(_delta):
	var light_positions = _get_light_positions()
	material.set_shader_parameter("number_of_lights", light_positions.size())
	material.set_shader_parameter("lights", light_positions)

func _get_light_positions():
	var viewport_size = get_viewport().get_visible_rect().size
	return get_tree().get_nodes_in_group("light").map(
		func(light: Node2D):
			var screen_pos = light.get_global_transform_with_canvas().origin
			# Convert to UV coordinates (0-1 range)
			return Vector2(screen_pos.x / viewport_size.x, screen_pos.y / viewport_size.y)
	)
