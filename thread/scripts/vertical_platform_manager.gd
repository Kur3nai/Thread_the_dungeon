extends Node2D

@export var move_height:float;
@onready var start_point:Node2D = $Start;
@onready var end_point:Node2D = $End;
@onready var platform:Node2D = $Platform;
@export var is_activated:bool = true;
@export var reverse: bool = false;
var up_to_down:bool = true;
@export var platform_speed:float = 1.0;

func _ready() -> void: 
	if reverse:
		start_point.position.y = platform.position.y + move_height;
		end_point.position.y = platform.position.y - move_height;
	else:
		start_point.position.y = platform.position.y - move_height;
		end_point.position.y = platform.position.y + move_height;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_activated:
		if reverse == false:
			if up_to_down:
				if platform.position.y < end_point.position.y:
					platform.position.y += (platform_speed * delta);
				else:
					up_to_down = !up_to_down;
			else: 
				if platform.position.y > start_point.position.y:
					platform.position.y -= (platform_speed * delta);
				else: 
					up_to_down = !up_to_down;
		else:
			if up_to_down:
				if platform.position.y > end_point.position.y:
					platform.position.y -= (platform_speed * delta)
				else:
					up_to_down = !up_to_down;
			else:
				if platform.position.y < start_point.position.y:
					platform.position.y += (platform_speed * delta)
				else:
					up_to_down = !up_to_down;
