extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	monitoring = false
	visible =false
	animation_player.animation_finished.connect(_on_animation_finished)

func _process(delta: float) -> void:
	var door_linked_lamp = get_tree().current_scene.get_node("Door_linked_lamp")
	var linked_lamp_torch = door_linked_lamp.get_node("Torch")
	
	if linked_lamp_torch.visible:
		monitoring = true
		visible = true
		if not animation_player.is_playing():       
			animation_player.play("Door_Open")
	else:
		monitoring = false
		visible = false
		pass

# This tiny extra function freezes the door on the last frame
func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Door_Open":
		animation_player.pause()  

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ShadyX"):
		get_tree().reload_current_scene()
