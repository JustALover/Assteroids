extends Area2D

var speed := 3000
var direction := Vector2.ZERO

func _physics_process(delta):

	position += direction * speed * delta
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_body_entered(_body: Node2D) -> void:
	queue_free()
