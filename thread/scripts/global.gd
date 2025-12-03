extends Node2D

# Player stats
var Speed = 300.0
var Jump_Velocity = -450.0
var Has_Darkvision: bool = false
var Vision_Radius: float = 0.0 
var ActiveRunes: Dictionary = {}  # key: rune_type, value: {value, duration, timer}
static var letter_visible: bool = false

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass
