extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$MilanoPaLantePaTraAnim.play("Milano (Pa-lante Pa-tra)")
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down"):
		if get_viewport().gui_get_focus_owner() == null:
			$PanelContainer/HBoxContainer/LeftContainer/ButtonsPlayerContainer/PlayButton.grab_focus()


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Game/ass_steroids.tscn")


func _on_exit_button_pressed() -> void:
	await get_tree().create_timer(0.2).timeout
	get_tree().quit()


func _on_credits_button_pressed() -> void:
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://Escenas/Credits/credits_menu.tscn")


func _on_options_button_pressed() -> void:
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://Escenas/Options Menu/options_menu.tscn")
