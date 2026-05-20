extends Node2D

#Esto deja poner las escenas en el inspector y en este caso se pondrán los meteoritos blanco y gris
@export var asteroid_grey : PackedScene
@export var asteroid_white : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	print("Enemy spawning...")
	var opciones = [asteroid_grey, asteroid_white]
	var elegido = opciones.pick_random()
	var asteroid = elegido.instantiate()
	add_child(asteroid)
	if elegido == asteroid_grey:
		print("Asteroide Gris")
	else:
		print("Asteroide Blanco")
