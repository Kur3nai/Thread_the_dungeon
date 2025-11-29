extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = false
	visible =false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var door_linked_lamp = get_tree().current_scene.get_node("Door_linked_lamp")
	var linked_lamp_torch = door_linked_lamp.get_node("Torch")
	if linked_lamp_torch.visible:
		monitoring = true
		visible = true
	else:
		monitoring = false
		visible = false
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ShadyX"):
		get_tree().reload_current_scene()
