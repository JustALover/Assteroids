extends Node

func kill():
	queue_free()
	
var score = 0

signal score_changed(new_score)

var highest_score = 0

func add_score(value):
	score += value
	score_changed.emit(score)
