extends Area2D

var player_in_area = false
var player:Node = null
@onready var torch: Sprite2D = $Torch
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var light_area:PointLight2D = torch.get_node("LightArea");
@export var activated_node:Node2D
@export var platform_holder:bool = false;
@export var light_size:float = 10.0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	torch.visible = false
	light_area.scale.x = light_size;
	light_area.scale.y = light_size;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("Interact"):
		var player_torch = player.get_node("Torch")
		if player_torch.visible:
			torch.visible = true
			player_torch.visible = false
			if platform_holder:
				_manipulate_platform();
			player.show_message("Press E to take out the torch")
		elif torch.visible:
			torch.visible = false
			player_torch.visible = true
			if platform_holder:
				_manipulate_platform();
			player.show_message("Press E to insert the torch")
		else:
			player.show_message("You need a torch")

func _manipulate_platform() -> void: 
	activated_node.is_activated = !activated_node.is_activated;

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
