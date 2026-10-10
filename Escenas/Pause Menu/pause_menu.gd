extends Control

var paused := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PressEscToPlayAnim.play("PRESS ESC FLICKERING")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Escenas/Assteroids Title Screen Menu/main_title_assteroids.tscn")
	
func _on_button_mouse_entered() -> void:
	$Button.scale = Vector2(1.1,1.1)

func _on_button_mouse_exited() -> void:
	$Button.scale = Vector2(1.0,1.0)
