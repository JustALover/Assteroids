extends CharacterBody2D

var direction = Vector2.ZERO
var speed = 8000

func _process(delta: float) -> void:
	velocity = direction * speed * delta
	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
