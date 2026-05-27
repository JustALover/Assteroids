extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Music/DeathSound.play()
	
	$CurrentScore.text = "Your Score" + " " + str(Global.get_score())
	
	$HighestScoreNumber.text = "Highest Score" + " " + str(Global.get_highest_score())
	
	$TryAgainAnim.play("TryAgainHeartBeat")
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down"):
		if get_viewport().gui_get_focus_owner() == null:
			$YESBUTTON.grab_focus()
	

func call_game():
	Global.reset_score()
	get_tree().change_scene_to_file("res://Escenas/Game/ass_steroids.tscn")


func _on_yesbutton_pressed() -> void:
	$SFXbuttons/PressedSFX.play()
	call_game()


func _on_nobutton_pressed() -> void:
	$SFXbuttons/PressedSFX.play()
	get_tree().change_scene_to_file("res://Escenas/Assteroids Title Screen Menu/main_title_assteroids.tscn")


func _on_yesbutton_focus_entered() -> void:
	$SFXbuttons/HoverAndFocusSFX.play()


func _on_nobutton_focus_entered() -> void:
	$SFXbuttons/HoverAndFocusSFX.play()
