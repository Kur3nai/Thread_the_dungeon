extends Area2D

var player_in_area = false
var player:Node = null
@onready var torch: Sprite2D = $Torch


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	torch.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("Interact"):
		var player_torch = player.get_node("Torch")
		if player_torch.visible:
			torch.visible = true
			player_torch.visible = false
			player.show_message("Press E to take out the torch")
		elif torch.visible:
			torch.visible = false
			player_torch.visible = true
			player.show_message("Press E to insert the torch")
		else:
			player.show_message("You need a torch")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ShadyX"):
		if torch.visible:
			player = body
			body.show_message("Press E to take out the torch")
			player_in_area = true
		else:  
			player = body
			body.show_message("Press E to insert the torch")
			player_in_area = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("ShadyX"):
		player = null
		body.hide_message()
		player_in_area = false
