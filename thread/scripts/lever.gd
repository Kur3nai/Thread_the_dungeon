extends Node2D

@export var trapdoor_holder: Node2D  
@onready var lever: AnimatedSprite2D = $Lever

var player_in_area: bool = false
var player: Node = null
var lever_active: bool = false  

func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("Interact"):
		_toggle_lever()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("ShadyX"):
		player_in_area = true
		player = body
		player.show_message("Press E to use the lever")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body == player:
		player_in_area = false
		player = null

func _toggle_lever():
	lever_active = not lever_active
	if trapdoor_holder:
		trapdoor_holder.activate(lever_active)

	# Animate the lever
	if lever:
		if lever_active:
			lever.play("Activate")        
		else:
			lever.play("Deactivate")  

	# Trigger the trapdoor
	if trapdoor_holder:
		trapdoor_holder.activate(lever_active) 

	if player:
		if lever_active:
			player.show_message("Lever activated")
		else:
			player.show_message("Lever deactivated")
