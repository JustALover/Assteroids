extends Node

func kill():
	queue_free()

signal score_changed(new_score)
signal highest_score_changed(new_highest_score)

var score := 0
var highest_score := 0

const SAVE_PATH = "user://savegame.save"

func _ready():
	load_high_score()

func add_score(value):
	score += value
	
	score_changed.emit(score)

	# 🏆 nuevo récord
	if score > highest_score:
		highest_score = score
		highest_score_changed.emit(highest_score)

		save_high_score()

func reset_score():
	score = 0
	score_changed.emit(score)

func get_score():
	return score

func get_highest_score():
	return highest_score

# 💾 GUARDAR
func save_high_score():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)

	if file:
		file.store_var(highest_score)

# 📂 CARGAR
func load_high_score():
	if FileAccess.file_exists(SAVE_PATH):

		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)

		if file:
			highest_score = file.get_var()
			highest_score_changed.emit(highest_score)
