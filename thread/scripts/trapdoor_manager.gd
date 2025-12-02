extends Node2D

@onready var start_point:Node2D = $Start;
@onready var end_point:Node2D = $End;
@onready var trapdoor:Node2D = $Trapdoor;
@export var end_height:float = 20;
@export var is_activated:bool = false;
@export var trapdoor_speed:float = 3.0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	end_point.position.y = -end_height;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_activated: 
		if trapdoor.position.y > end_point.position.y: 
			trapdoor.position.y -= trapdoor_speed * delta;
	else:
		if trapdoor.position.y < start_point.position.y:
			trapdoor.position.y += trapdoor_speed * delta;
