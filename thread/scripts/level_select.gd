extends Control

@export var lv1: Button;
@export var lv2: Button;
@export var lv3: Button;
@export var lv4: Button;
@export var lv5: Button;
@export var lv6: Button;
@export var lv7: Button;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match Global.max_level:
		1:
			lv2.hide()
			lv3.hide()
			lv4.hide()
			lv5.hide()
			lv6.hide()
			lv7.hide()
		2:
			lv3.hide()
			lv4.hide()
			lv5.hide()
			lv6.hide()
			lv7.hide()
		3:
			lv4.hide()
			lv5.hide()
			lv6.hide()
			lv7.hide()
		4:
			lv5.hide()
			lv6.hide()
			lv7.hide()
		5:
			lv6.hide()
			lv7.hide()
		6:
			lv7.hide()
		_:
			pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_level_1_button_pressed() -> void:
	if Global.max_level >= 1:
		AudioManager._on_scene_changed("1")
		get_tree().change_scene_to_file("res://scene/Level Design/Level_1.tscn")


func _on_level_2_button_pressed() -> void:
	if Global.max_level >= 2:
		AudioManager._on_scene_changed("1")
		get_tree().change_scene_to_file("res://scene/Level Design/Level_2.tscn")


func _on_level_3_button_pressed() -> void:
	if Global.max_level >= 3:
		AudioManager._on_scene_changed("1")
		get_tree().change_scene_to_file("res://scene/Level Design/Level_3.tscn")


func _on_level_4_button_pressed() -> void:
	if Global.max_level >= 4:
		AudioManager._on_scene_changed("2")
		get_tree().change_scene_to_file("res://scene/Level Design/Level_4.tscn")


func _on_level_5_button_pressed() -> void:
	if Global.max_level >= 5:
		AudioManager._on_scene_changed("2")
		get_tree().change_scene_to_file("res://scene/Level Design/Level_5.tscn")


func _on_level_6_button_pressed() -> void:
	if Global.max_level >= 6:
		AudioManager._on_scene_changed("3")
		get_tree().change_scene_to_file("res://scene/Level Design/Level_6.tscn")


func _on_level_7_button_pressed() -> void:
	if Global.max_level >= 7:
		AudioManager._on_scene_changed("3")
		get_tree().change_scene_to_file("res://scene/Level Design/Level_7.tscn")
