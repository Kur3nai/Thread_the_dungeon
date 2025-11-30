extends AudioStreamPlayer

# Make sure the AudioStreamPlayer node is named exactly this
@onready var music_player:AudioStreamPlayer = $"."

const Level1:String = "res://assets/Audio/The Abandoned Hall.mp3"
const Level2:String = "res://assets/Audio/A Traveller's Respite.mp3"
const Level3:String = "res://assets/Audio/The End of the Road.mp3"

const scene_map := {
	"Main": Level1,
	"Scene 1": Level1,
	"Scene 2": Level2,
	"Scene 3": Level3
}

func _ready():
	_on_scene_changed("Main")

func _on_scene_changed(new_scene):
	if new_scene == null:
		return
	
	var scene_name:String = new_scene

	if scene_map.has(scene_name):
		var target_music:String = scene_map[scene_name]
		_play_if_different(target_music, )

func _play_if_different(stream_path: String):
	var stream := load(stream_path)
	if music_player.stream == stream:
		return

	music_player.stream = stream
	music_player.play()
