extends HSlider

var audio_bus_id
@export var audio_bus_name: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)



func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(audio_bus_id,value)
