extends CanvasLayer

#Pause Menu
var paused := false

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		paused = !paused
		get_tree().paused = paused
		
		$PauseMenuUI.visible = paused
		print("Juego ha sido pausado o despausado")
