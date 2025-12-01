extends Node2D

@export var move_width:float;
@onready var start_point:Node2D = $Start;
@onready var end_point:Node2D = $End;
@onready var platform:Node2D = $Platform;
@export var is_activated:bool = true;
var left_to_right:bool = true;
@export var platform_speed:float = 1.0;

func _ready() -> void: 
	start_point.position.x = platform.position.x - move_width;
	end_point.position.x = platform.position.x + move_width;
	print(position.x + move_width)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_activated:
		if left_to_right:
			if platform.position.x < end_point.position.x:
				platform.position.x += (platform_speed * delta);
			else:
				left_to_right = !left_to_right;
		else: 
			if platform.position.x > start_point.position.x:
				platform.position.x -= (platform_speed * delta);
			else: 
				left_to_right = !left_to_right;
