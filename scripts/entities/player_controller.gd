extends Entity

#ABILITIES
var move = load_ability("move")

#STATE
func _physics_process(delta: float) -> void:	
	var speed = 10.0
	var dir = Input.get_vector("right", "left", "up", "down")
	var direction := (transform.basis * Vector3(dir.x, 0, dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	move_and_slide()
