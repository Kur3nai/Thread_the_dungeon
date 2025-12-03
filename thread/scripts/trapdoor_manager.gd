extends Node2D

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var collider: CollisionShape2D = $Area2D/CollisionShape2D

var is_open = false

func open_trapdoor():
	if is_open:
		return
		
	is_open = true
	anim.play("open") 
	await anim.animation_finished
	collider.disabled = true
