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
	#Cargar la posición y valores de los sliders
	load_sliders()

#Quita temporalmente cualquier señal entrante para ajustar los valores de los sliders
#Así haciendo que no haya bugs extraños
func load_sliders():
	$Node2D/MasterChangervolume.set_block_signals(true)
	$Node2D/SFXChangervolume.set_block_signals(true)
	$Node2D/MusicChangervolume.set_block_signals(true)

	$Node2D/MasterChangervolume.value = Settings.master_volume
	$Node2D/SFXChangervolume.value = Settings.sfx_volume
	$Node2D/MusicChangervolume.value = Settings.music_volume
	

	$Node2D/MasterChangervolume.set_block_signals(false)
	$Node2D/SFXChangervolume.set_block_signals(false)
	$Node2D/MusicChangervolume.set_block_signals(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

#MASTER BUS MANAGER
func _on_volume_changer_value_changed(value: float) -> void:
	var bus = AudioServer.get_bus_index("Master")

	AudioServer.set_bus_volume_db(bus, linear_to_db(value))

	Settings.master_volume = value
	Settings.save_settings()

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
	var bus = AudioServer.get_bus_index("SFX")

	AudioServer.set_bus_volume_db(bus, linear_to_db(value))

	Settings.sfx_volume = value
	Settings.save_settings()


#MUSIC BUS MANAGER
func _on_music_changervolume_drag_ended(_value_changed: bool) -> void:
	$Node2D/MusicChangervolume/MusicAudioTest.play()


func _on_music_changervolume_value_changed(value: float) -> void:
	var bus = AudioServer.get_bus_index("Music")

	AudioServer.set_bus_volume_db(bus, linear_to_db(value))

	Settings.music_volume = value
	Settings.save_settings()
