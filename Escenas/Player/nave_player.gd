extends CharacterBody2D

@export var bullet_scene : PackedScene
@onready var bullets_container = get_tree().current_scene.get_node("BulletsContainer")

var normal_speed := 50000
var sprint_speed := 90000

var rotation_velocity := 0.0
var rotation_acceleration := 0.009
var rotation_friction := 0.92
var can_shoot := true #Cooldown para disparos

func shoot():
	
	can_shoot = false
	
	var bullet = bullet_scene.instantiate()

	bullet.global_position =$MarkerBala.global_position

	bullet.rotation = rotation

	bullet.direction = -transform.y
	
	get_tree().current_scene.get_node("BulletsContainer").add_child(bullet)
	
	$ShootCooldown.start()
	
func die():
	print("GAME OVER 💥")
	get_tree().change_scene_to_file("res://Escenas/Pantalla de Muerte/youre_dead_menu.tscn")


func _physics_process(delta):
	
	if Input.is_action_pressed("SHOOT") and can_shoot:
		play_shoot_sound()
		shoot()
	
	var current_speed = normal_speed
	if Input.is_action_pressed("BOOST MOVEMENT"):
		current_speed = sprint_speed
		$EngineBoost.play("BOOST")
	else:
		$EngineBoost.stop()
		
		
	# GIRAR
	if Input.is_action_pressed("LEFT"):
		rotation_velocity -= rotation_acceleration

	elif Input.is_action_pressed("RIGHT"):
		rotation_velocity += rotation_acceleration
		
	# Fricción del giro
	rotation_velocity *= rotation_friction

	# Aplicar rotación
	rotation += rotation_velocity
	
	$EngineFire.visible = Input.is_action_pressed("UP")
	# MOVIMIENTO (Solo se mueve hacia adelante, donde esté la nariz de la nave)
	if Input.is_action_pressed("UP"):
		velocity = -transform.y * current_speed * delta
		$EngineFire.play("EngineIgnited")
		
	else:
		velocity = Vector2.ZERO
		$EngineFire.stop()
		#Esto hace que el objeto  se detenga y no patine como en hielo

	move_and_slide()


func _on_shoot_cooldown_timeout() -> void:
	can_shoot = true


func _on_area_2d_area_entered(meteorito: Area2D) -> void:
	if meteorito.is_in_group("asteroids"):
		call_deferred("die")
		

#Función para hacer el Pew de la nave no se corte de la nada
func play_shoot_sound():
	var sound = AudioStreamPlayer2D.new()
	add_child(sound)

	sound.stream = preload("res://SFX/Disparo nave/Shootnave.ogg")
	sound.pitch_scale = randf_range(0.9, 1.2)
	sound.bus = "SFX"
	sound.global_position = global_position
	sound.play()

	await sound.finished
	sound.queue_free()
