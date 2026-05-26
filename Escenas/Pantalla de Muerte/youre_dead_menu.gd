extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$CurrentScore.text = "Your Score" + " " + str(Global.get_score())
	
	$HighestScoreNumber.text = "Highest Score" + " " + str(Global.get_highest_score())
	
	$TryAgainAnim.play("TryAgainHeartBeat")
	
	$YESBUTTON.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	

func call_game():
	Global.reset_score()
	get_tree().change_scene_to_file("res://Escenas/Game/ass_steroids.tscn")


func _on_yesbutton_pressed() -> void:
	call_game()


func _on_nobutton_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Assteroids Title Screen Menu/main_title_assteroids.tscn")
