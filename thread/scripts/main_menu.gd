extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Button_Container.visible = true
	$Options_Panel.visible = false


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/Level Design/Level_Select.tscn")


func _on_options_pressed() -> void:
	$Button_Container.visible = false
	$Options_Panel.visible = true


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_button_pressed() -> void:
	_ready()
