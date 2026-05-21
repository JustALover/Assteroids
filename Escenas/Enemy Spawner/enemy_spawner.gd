extends Node2D

#Esto deja poner las escenas en el inspector y en este caso se pondrán los meteoritos blanco y gris
@export var asteroid_grey : PackedScene
@export var asteroid_white : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	#print("Enemy spawning...")
	var opciones = [asteroid_grey, asteroid_white]
	var elegido = opciones.pick_random()
	var asteroid = elegido.instantiate()
	#if elegido == asteroid_grey:
		#print("Asteroide Gris")
	#else:
		#print("Asteroide Blanco")
	var screen_size = get_viewport_rect().size
	var center = screen_size / 2
	var lado = randi() % 4

	match lado:
		0:
			asteroid.position = Vector2(randf_range(0, screen_size.x), -50)

		1:
			asteroid.position = Vector2(randf_range(0, screen_size.x), screen_size.y + 50)

		2:
			asteroid.position = Vector2(-50, randf_range(0, screen_size.y))

		3:
			asteroid.position = Vector2(screen_size.x + 50, randf_range(0, screen_size.y))

	# Dirección hacia el centro
	var direction = (center - asteroid.position).normalized()

	# Pequeña variación random
	direction = direction.rotated(deg_to_rad(randf_range(-25, 25)))

	asteroid.direction = direction

	add_child(asteroid)
