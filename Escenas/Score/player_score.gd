extends CanvasLayer

@onready var score_label = $PlayerScoreLabel

func _ready():
	Global.score_changed.connect(_on_score_changed)
	
	_on_score_changed(Global.score)

func _on_score_changed(new_score):
	score_label.text = str(new_score)
