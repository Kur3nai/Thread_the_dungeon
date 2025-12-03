extends Node2D

@onready var trapdoor: AnimatedSprite2D = $Trapdoor
@onready var collision_shape_2d: CollisionShape2D = $StaticBody2D/CollisionShape2D

func activate(active: bool):
	if not trapdoor:
		return
	
	trapdoor.visible = true  
	
	if active:
		trapdoor.play("Activated")
		collision_shape_2d.set_deferred("disabled",true)
	else:
		trapdoor.play_backwards("Activated")
		await get_tree().create_timer(1.0).timeout
		collision_shape_2d.set_deferred("disabled",false)
