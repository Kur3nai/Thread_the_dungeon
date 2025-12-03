extends Control

@onready var light:DirectionalLight2D = get_node("../DirectionalLight2D");

func _ready() -> void:
	self.visible = false;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		self.visible = !self.visible
		get_tree().paused = !get_tree().paused;
	light.visible = !self.visible;

func _on_resume_button_pressed() -> void:
	self.visible = false
	get_tree().paused = false


func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/Level Design/Main_Menu.tscn")
