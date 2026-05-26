extends TextureButton

var pressedd := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	$AnimationsPlayButton.play("Hover")
	pressedd = false

func _on_mouse_exited() -> void:
	if pressedd == true:
		pass
	else:
		$AnimationsPlayButton.play("DesHover")


func _on_button_down() -> void:
	$AnimationsPlayButton.play("Pressed")
	pressedd = true
	#await get_tree().create_timer(0.040).timeout
	#get_tree().change_scene_to_file("res://Escenas/Game/ass_steroids.tscn")


func _on_button_up() -> void:
	$AnimationsPlayButton.play("RESET")
