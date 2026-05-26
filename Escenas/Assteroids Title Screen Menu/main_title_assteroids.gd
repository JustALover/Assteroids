extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MilanoPaLantePaTraAnim.play("Milano (Pa-lante Pa-tra)")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	await get_tree().create_timer(0.040).timeout
	get_tree().change_scene_to_file("res://Escenas/Game/ass_steroids.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
