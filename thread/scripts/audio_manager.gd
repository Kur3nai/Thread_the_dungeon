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


@onready var music_volume_bus = AudioServer.get_bus_index("Music")

func _ready():
	bus = "Music"
	_on_scene_changed("Main")

func _on_scene_changed(new_scene):
	if new_scene == null:
		return
	var scene_name:String = new_scene
	if scene_map.has(scene_name):
		var next_stream = load(scene_map[scene_name])
		if stream != next_stream:
			fade_to(next_stream, 0.5)  #0.5 seconds fade	var target_music:String = scene_map[scene_name]

func fade_to(new_stream: AudioStream, duration: float = 1.0) -> void:
	var start_vol_db = music_player.volume_db
	var end_vol_db = -80.0  # minimum volume = silent
	
	# Fade out
	var time_passed = 0.0
	while time_passed < duration:
		var t = time_passed / duration
		volume_db = lerp(start_vol_db, end_vol_db, t)
		await get_tree().process_frame
		time_passed += get_process_delta_time()
	
	# Switch stream
	stream = new_stream
	play()
	
	# Fade in
	time_passed = 0.0
	while time_passed < duration:
		var t = time_passed / duration
		volume_db = lerp(end_vol_db, start_vol_db, t)
		await get_tree().process_frame
		time_passed += get_process_delta_time()
	
	volume_db = start_vol_db  # ensure final volume is exact
