extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false

func _on_pressed() -> void:
	#get_tree().paused = false
	Global.letter_visible = false
	self.visible = false
