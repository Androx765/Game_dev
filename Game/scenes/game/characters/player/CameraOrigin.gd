extends Node3D
# Script to move the camera with the player and assure fixed camera rotation

@export var player: Node3D
@export var lerp_speed: float = 0.01

var initial_basis: Basis

func _ready():
# Check if the player node is assigned and valid
	if player == null:
		player = get_parent()
		
	#
	initial_basis = global_transform.basis

func _physics_process(delta):
	# Update the CameraOrigin position to match the player's position
	var new_position = global_position.lerp(player.global_position, lerp_speed * delta)
	global_transform = Transform3D(initial_basis, new_position)
