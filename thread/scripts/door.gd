extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
var has_played = false

func _ready() -> void:
	monitoring = false
	visible = false

func _process(delta: float) -> void:
	var door_linked_lamp = get_tree().current_scene.get_node("Door_linked_lamp")
	var linked_lamp_torch = door_linked_lamp.get_node("Torch")
	if linked_lamp_torch.visible:
		if not has_played:
			monitoring = true
			visible = true
			animation_player.play("Door_Open")
			has_played = true
	else:
		monitoring = false
		visible = false
		animation_player.stop()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ShadyX"):
		get_tree().reload_current_scene()
