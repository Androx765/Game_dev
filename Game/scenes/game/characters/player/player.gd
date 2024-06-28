extends CharacterBody3D

@export var speed = 5.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@export var mesh_node: Node3D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	get_move_input(delta)
	move_and_slide()
	


# handle the movement/deceleration.
func get_move_input(delta):
	
	# Get the input direction
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		
		var angular_rotation = 10
		mesh_node.rotation.y = lerp_angle(mesh_node.rotation.y, atan2(velocity.x, velocity.z) - rotation.y, delta * angular_rotation)
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
