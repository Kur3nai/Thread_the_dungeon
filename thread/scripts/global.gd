extends Node2D

# Player stats
const base_speed:float = 300.0
static var Speed:float = 300.0
const base_jump_velocity:float = -450.0
static var Jump_Velocity:float = -450.0
static var Has_Darkvision: bool = false
var Vision_Radius: float = 0.0 
var ActiveRunes: Dictionary = {}  # key: rune_type, value: {value, duration, timer}
static var letter_visible: bool = false
static var max_level: int = 1;

func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass
