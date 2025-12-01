extends Node2D

func _on_pickup_range_entered(body: Node2D):
	if(body.is_in_group("ShadyX")):
		body.has_darkvision = true;
		queue_free();
