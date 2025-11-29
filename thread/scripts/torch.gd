extends Sprite2D
@export var loop = true
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not self.visible:
		animation_player.stop()
	else:
		animation_player.play("Torch")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not self.visible:
		animation_player.stop()
	else:
		animation_player.play("Torch")
