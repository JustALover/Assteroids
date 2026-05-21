extends CharacterBody2D

var direction = Vector2.ZERO
var speed = 8000

func _process(delta: float) -> void:
	velocity = direction * speed * delta
	move_and_slide()
	
	if position.x < -3121 or position.x > 3911:
		queue_free()

	if position.y < -2292 or position.y > 2130:
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_area_2d_area_entered(bala) -> void:
	if bala.is_in_group("bullets"):
		queue_free()
		bala.queue_free()
