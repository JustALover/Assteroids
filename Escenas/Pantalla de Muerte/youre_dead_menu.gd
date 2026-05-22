extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CurrentScore.text = "Your Score" + " " + str(Global.get_score())
	$HighestScoreNumber.text = "Highest Score" + " " + str(Global.get_highest_score())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("CONFIRM") or Input.is_action_just_pressed("CLICK CONFIRM"):
		call_deferred("call_game")
	

func call_game():
	Global.reset_score()
	get_tree().change_scene_to_file("res://Escenas/Game/ass_steroids.tscn")
