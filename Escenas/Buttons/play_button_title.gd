extends TextureButton

var pressedd := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	$HoverAndFocusSFX.play()
	$AnimationsPlayButton.play("Hover")
	pressedd = false

func _on_mouse_exited() -> void:
	if pressedd == true:
		pass
	else:
		$AnimationsPlayButton.play("DesHover")


func _on_button_down() -> void:
	$PressedSFX.play()
	$AnimationsPlayButton.play("Pressed")
	pressedd = true


func _on_button_up() -> void:
	$AnimationsPlayButton.play("RESET")


func _on_focus_entered() -> void:
	$HoverAndFocusSFX.play()
	$AnimationsPlayButton.play("Hover")


func _on_focus_exited() -> void:
	$AnimationsPlayButton.play("DesHover")
