extends Node

#Función para guardar los settings del jugador del volumen y la posición de sliders
const SAVE_PATH = "user://settings.save"

var master_volume := 1.0
var music_volume := 1.0
var sfx_volume := 1.0


func save_settings():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)

	file.store_var(master_volume)
	file.store_var(music_volume)
	file.store_var(sfx_volume)


func load_settings():
	if !FileAccess.file_exists(SAVE_PATH):
		return

	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)

	master_volume = file.get_var()
	music_volume = file.get_var()
	sfx_volume = file.get_var()

#Función para asignación de variables de cada canal de audio a su respectivo bus
func apply_audio():
	var master_bus = AudioServer.get_bus_index("Master")
	var music_bus = AudioServer.get_bus_index("Music")
	var sfx_bus = AudioServer.get_bus_index("SFX")

	AudioServer.set_bus_volume_db(master_bus, linear_to_db(master_volume))

	AudioServer.set_bus_volume_db(music_bus, linear_to_db(music_volume))

	AudioServer.set_bus_volume_db(sfx_bus, linear_to_db(sfx_volume))


func _ready():
	load_settings()
	apply_audio()
