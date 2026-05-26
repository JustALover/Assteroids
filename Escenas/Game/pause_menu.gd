extends CanvasLayer

#Pause Menu
var paused := false

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		paused = !paused
		get_tree().paused = paused
		
		$PauseMenuUI.visible = paused
		print("Juego ha sido pausado o despausado")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
