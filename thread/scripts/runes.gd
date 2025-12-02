extends Node2D

@export var rune_type: String = "has_darkvision" 

func _on_pickup_range_entered(body: Node2D):
	if(body.is_in_group("ShadyX")):
		match rune_type: 
			"has_darkvision":
				Global.has_darkvision = true
			"increase_speed":
				Global.speed += 50
			"increase_jump":
				Global.Jump_velocity -= 100
			"increase_vision_radius":
				body.vision_radius += 5
				if body.has_darkvision:
					body.vision_size = Vector2(body.vision_radius, body.vision_radius)
		queue_free()
