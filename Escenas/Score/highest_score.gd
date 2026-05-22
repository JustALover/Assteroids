extends Node

@onready var highest_score_label = $HighestScoreNumber

func _ready():
	Global.highest_score_changed.connect(_on_highest_score_changed)

	_on_highest_score_changed(Global.highest_score)

func _on_highest_score_changed(new_highest_score):
	highest_score_label.text = str(new_highest_score)
