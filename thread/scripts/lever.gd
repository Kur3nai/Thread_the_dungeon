extends Node2D

@export var trapdoor_holder: Node2D  
@onready var lever: AnimatedSprite2D = $Lever

var player_in_area: bool = false
var player: Node = null
var lever_active: bool = false  

func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("Interact"):
		_toggle_lever()
		if player:
			if lever_active:
				player.show_message("Lever activated")
			else:
				player.show_message("Lever deactivated")
	if player_in_area:
		player.show_message("Press E to use the lever")

func _on_lever_area_entered(body: Node2D) -> void:
	if body.is_in_group("ShadyX"):
		player_in_area = true
		player = body

func _on_lever_area_exited(body: Node2D) -> void:
	if body == player:
		player_in_area = false
		player = null
	body.hide_message()

func _toggle_lever():
	
	trapdoor_holder.is_activated = !trapdoor_holder.is_activated;
	lever_active = !lever_active

	var count: int = 0;

	if trapdoor_holder.is_activated:
		if count < 1:
			trapdoor_holder.animation_played = false;
			count += 1
	else:
		if count < 1:
			trapdoor_holder.animation_played = false;
			count += 1;
