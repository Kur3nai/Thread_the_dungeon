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
			visible = true
			animation_player.play("Door_Open")
			has_played = true
	else:
		monitoring = false
		visible = false
		animation_player.stop()
		has_played = false

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ShadyX"):
		var current_scene:String = get_tree().current_scene.name
		if current_scene == "Level_1":
			Global.max_level = 2
			get_tree().change_scene_to_file("res://scene/Level Design/Level_2.tscn")
		elif current_scene == "Level_2":
			Global.max_level = 3
			get_tree().change_scene_to_file("res://scene/Level Design/Level_3.tscn")
		elif current_scene == "Level_3": 
			Global.max_level = 4
			get_tree().change_scene_to_file("res://scene/Level Design/Level_4.tscn")
		elif current_scene == "Level_4":
			Global.max_level = 5
			AudioManager._on_scene_changed("2")
			get_tree().change_scene_to_file("res://scene/Level Design/Level_5.tscn")
		elif current_scene == "Level_5":
			Global.max_level = 6
			get_tree().change_scene_to_file("res://scene/Level Design/Level_6.tscn")
		elif current_scene == "Level_6":
			Global.max_level = 7
			AudioManager._on_scene_changed("3")
			get_tree().change_scene_to_file("res://scene/Level Design/Level_7.tscn")
		elif current_scene == "Level_7":
			Global.max_level = 8
			get_tree().change_scene_to_file("res://scene/Level Design/Main_Menu.tscn");

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "Door_Open":
		monitoring = true
