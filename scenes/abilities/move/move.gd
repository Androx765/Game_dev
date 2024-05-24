extends Node3D

func execute(s):
	var speed = 10.0
	var dir = Input.get_vector("left", "right", "up", "down")
	var direction := (transform.basis * Vector3(dir.x, 0, dir.y)).normalized()
	if direction:
		s.velocity.x = direction.x * speed
		s.velocity.z = direction.z * speed
	else:
		s.velocity.x = move_toward(s.velocity.x, 0, speed)
		s.velocity.z = move_toward(s.velocity.z, 0, speed)
	s.move_and_slide
	
