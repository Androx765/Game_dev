extends CharacterBody3D

@export var speed = 5.0
@export var acceleration = 5.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# attack animation names
var attacks = [
	"melee_attack"
]
var is_attacking = false

@onready var mesh_node: Node3D = $playerModelWAnim
@onready var anim_tree = $playerModelWAnim.get_children()[2]
@onready var anim_state = $playerModelWAnim.get_children()[2].get("parameters/playback")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	get_move_input(delta)
	move_and_slide()
	
	# handle rotation
	if velocity.length() > 1.0:
		var angular_rotation = 10
		mesh_node.rotation.y = lerp_angle(mesh_node.rotation.y, atan2(velocity.x, velocity.z) - rotation.y, delta * angular_rotation)
	


# handle the movement/deceleration.
func get_move_input(delta):
	var vy = velocity.y
	velocity.y = 0
	
	# Get the input direction
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	# change velocity of player
	velocity = lerp(velocity, direction * speed, acceleration * delta)
	
	# set the blend position in the IWR blendspace depending on the velocity
	anim_tree.set("parameters/IWR/blend_position", Vector2(velocity.x, -velocity.z) / speed)
	
	velocity.y = vy
	
	# change animation condition "is_moving"
	if (input_dir == Vector2.ZERO):
		anim_tree["parameters/conditions/is_moving"] = false
	else:
		anim_tree["parameters/conditions/is_moving"] = true

func _unhandled_input(event):
	# attacks
	if event.is_action_pressed("melee_attack"):
		melee_attack()
	
	# dances
	if event.is_action_pressed("dance1"):
		anim_state.travel("dance1")
	if event.is_action_pressed("dance2"):
		anim_state.travel("dance2")

func melee_attack():
	# chooses a random melee-attack
	anim_state.travel(attacks.pick_random())
