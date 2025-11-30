extends Area2D

@export var target = Node
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var player:Node = null
var player_in_area = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("Torch")  
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("Interact"):
		self.queue_free()
		var player_torch = player.get_node("Torch")
		player_torch.visible = true

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ShadyX"):
		player = body
		body.show_message("Press E to pick up the light")
		player_in_area = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("ShadyX"):
		player = null
		body.hide_message()
		player_in_area = false
