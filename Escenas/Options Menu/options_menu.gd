extends Control

####Funciones para ubicar el slider donde se habia quedado
#Problema grande, no funciona o funciona muy mal xd
func masteraudioplacement():
	var master_bus = AudioServer.get_bus_index("Master")
#
	var volume_db = AudioServer.get_bus_volume_db(master_bus)
#
	$Node2D/MasterChangervolume.value = db_to_linear(volume_db)

func sxfaudioplacement():
	var SFX_bus = AudioServer.get_bus_index("SFX")
#
	var volume_db = AudioServer.get_bus_volume_db(SFX_bus)
#
	$Node2D/SFXChangervolume.value = db_to_linear(volume_db)
	
func musicaudioplacement():
	var Music_bus = AudioServer.get_bus_index("Music")
#
	var volume_db = AudioServer.get_bus_volume_db(Music_bus)
#
	$Node2D/MusicChangervolume.value = db_to_linear(volume_db)
	
################################################################
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CheckBox.button_pressed = (DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN)
	#Llamada de funciones del placement de los sliders al salir de options
	masteraudioplacement()
	sxfaudioplacement()
	musicaudioplacement()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

#MASTER BUS MANAGER
func _on_volume_changer_value_changed(value: float) -> void:
	var master_bus = AudioServer.get_bus_index("Master")

	if value <= 0:
		AudioServer.set_bus_mute(master_bus, true)
	else:
		AudioServer.set_bus_mute(master_bus, false)
		AudioServer.set_bus_volume_db(master_bus,linear_to_db(value))

func _on_volume_changer_drag_ended(_value_changed: bool) -> void:
	$Node2D/MasterChangervolume/MasterAudioTest.play()



#BOTÓN DE SALIDA AL MENÚ PRINCIPAL
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Assteroids Title Screen Menu/main_title_assteroids.tscn")


#MANAGER DE PANTALLA COMPLETA
func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
var config = ConfigFile.new()

func save_settings(fullscreen: bool):
	config.set_value("video", "fullscreen", fullscreen)
	config.save("user://settings.cfg")
	
func load_settings():
	if config.load("user://settings.cfg") == OK:
		var fullscreen = config.get_value("video", "fullscreen", false)
		
		if fullscreen:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			


#SFX BUS MANAGER
func _on_sfx_changervolume_drag_ended(_value_changed: bool) -> void:
	$Node2D/SFXChangervolume/SFXAudioTest.play()


func _on_sfx_changervolume_value_changed(value: float) -> void:
	var SFX_bus = AudioServer.get_bus_index("SFX")

	if value <= 0:
		AudioServer.set_bus_mute(SFX_bus, true)
	else:
		AudioServer.set_bus_mute(SFX_bus, false)
		AudioServer.set_bus_volume_db(SFX_bus,linear_to_db(value))


#MUSIC BUS MANAGER
func _on_music_changervolume_drag_ended(_value_changed: bool) -> void:
	$Node2D/MusicChangervolume/MusicAudioTest.play()


func _on_music_changervolume_value_changed(value: float) -> void:
	var music_bus = AudioServer.get_bus_index("Music")

	if value <= 0:
		AudioServer.set_bus_mute(music_bus, true)
	else:
		AudioServer.set_bus_mute(music_bus, false)
		AudioServer.set_bus_volume_db(music_bus,linear_to_db(value))
