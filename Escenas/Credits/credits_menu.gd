extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/ScrollContainer/VBoxContainer/SpecialThanksColorChange.play("Special Thanks color change")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") or Input.is_action_just_pressed("CLICK CONFIRM"):
		get_tree().change_scene_to_file("res://Escenas/Assteroids Title Screen Menu/main_title_assteroids.tscn")
