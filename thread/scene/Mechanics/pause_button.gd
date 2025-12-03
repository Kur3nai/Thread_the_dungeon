extends Button
@onready var pause_menu: Control = $Pause_Menu


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = true
	pause_menu.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	get_tree().paused = true
	pause_menu.visible = true
