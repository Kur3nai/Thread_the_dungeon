extends Node2D

@onready var trapdoor: AnimatedSprite2D = $Trapdoor
@onready var collision_shape_2d: CollisionShape2D = $Trapdoor/StaticBody2D/CollisionShape2D
@export var is_activated:bool = false
var animation_played:bool = false;

func _process(delta:float) -> void:
	if self.is_activated:
		collision_shape_2d.disabled = true;
		if !animation_played:
			trapdoor.play("Activated")
			animation_played = true;
	else:
		collision_shape_2d.disabled = false;
		if !animation_played:
			trapdoor.play_backwards("Activated");
			animation_played = true;
