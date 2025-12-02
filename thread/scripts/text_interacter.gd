extends Area2D

var player_in_area = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("Interact"):
		var letter = get_tree().current_scene.get_node("Letter")
		letter.visible = true
		get_tree().paused = true


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ShadyX"):
		player_in_area = true
		body.show_message("Press E to pick up the letter")



func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("ShadyX"):
		player_in_area = false
		body.hide_message()
