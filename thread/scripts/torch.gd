extends Sprite2D

@export var loop := true
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var light_area:PointLight2D = $LightArea;
var was_visible := false   
@export var letter:Button;

func _ready() -> void:
	was_visible = self.visible
	
	if visible:
		animation_player.play("Torch")

	else:
		animation_player.stop()

func _process(delta: float) -> void:
	if visible != was_visible:
		was_visible = visible
		if visible:
			animation_player.play("Player_interaction")
		else:
			animation_player.stop()
	
