extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var mesh_node = $PlayerPrototypeModel
var initial_rotation_y: float

func _ready():
	# Save the initial rotation offset
	initial_rotation_y = rotation.y

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		
		# Calculate the target rotation based on direction
		var target_rotation_y = atan2(direction.x, direction.z)
		
		# Adjust the target rotation by the initial rotation offset
		target_rotation_y -= initial_rotation_y
		
		# Create the target rotation vector
		var target_rotation = Vector3(0, target_rotation_y, 0)
		
		# Smoothly interpolate the mesh rotation
		mesh_node.rotation = mesh_node.rotation.slerp(target_rotation, 0.1)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
