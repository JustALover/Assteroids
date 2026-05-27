extends CharacterBody2D

var direction = Vector2.ZERO
var speed = 8000
var player: Node2D
@export var max_distance := 4000.0
var asteroid_sounds = [
	preload("res://SFX/Asteroides Boom/AsteroidBoom.wav"),
	preload("res://SFX/Asteroides Boom/AsteroidBoom2.wav")
]

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
		#PUNTAJE:
		Global.add_score(5)
		#SONIDO BOOM:
		play_asteroid_sound()
		#DESTRUIR BALA Y ASTEROIDE:
		queue_free()
		bala.queue_free()

func play_asteroid_sound():
	var sound = AudioStreamPlayer2D.new()
	get_tree().current_scene.add_child(sound)

	sound.stream = asteroid_sounds.pick_random()
	sound.pitch_scale = randf_range(0.5, 1.5)
	sound.bus = "SFX"
	
	sound.global_position = global_position
	
	sound.play()

	await sound.finished
	sound.queue_free()
		
