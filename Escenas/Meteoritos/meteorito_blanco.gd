extends CharacterBody2D

var direction = Vector2.ZERO
var speed = 8000
var player: Node2D
@export var max_distance := 4000.0

func _ready():
	player = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	velocity = direction * speed * delta
	move_and_slide()
	
	if player == null:
		return

	if global_position.distance_to(player.global_position) > max_distance:
		queue_free()


func _on_area_2d_area_entered(bala) -> void:
	if bala.is_in_group("bullets"):
		queue_free()
		bala.queue_free()
