extends Node2D

func _on_player_enter(body: Node2D):
	if body.is_in_group("ShadyX"):
		body.die()
