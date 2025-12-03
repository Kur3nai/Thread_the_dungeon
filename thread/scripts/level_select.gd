extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.max_level=1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_level_1_button_pressed() -> void:
	if Global.max_level >= 1:
		get_tree().change_scene_to_file("res://scene/Level Design/Level_1.tscn")


func _on_level_2_button_pressed() -> void:
	if Global.max_level >= 2:
		get_tree().change_scene_to_file("res://scene/Level Design/Level_2.tscn")


func _on_level_3_button_pressed() -> void:
	if Global.max_level >= 3:
		get_tree().change_scene_to_file("res://scene/Level Design/Level_3.tscn")


func _on_level_4_button_pressed() -> void:
	if Global.max_level >= 4:
		get_tree().change_scene_to_file("res://scene/Level Design/Level_4.tscn")


func _on_level_5_button_pressed() -> void:
	if Global.max_level >= 5:
		get_tree().change_scene_to_file("res://scene/Level Design/Level_5.tscn")


func _on_level_6_button_pressed() -> void:
	if Global.max_level >= 6:
		get_tree().change_scene_to_file("res://scene/Level Design/Level_6.tscn")


func _on_level_7_button_pressed() -> void:
	if Global.max_level >= 7:
		get_tree().change_scene_to_file("res://scene/Level Design/Level_7.tscn")
