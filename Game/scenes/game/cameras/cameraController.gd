extends Node3D

@export var player: Node3D
@export var follow_speed: float = 0.05 # 0.0 (slow) - 1.0 (instant)
var camera_pivot: Node3D

func _ready():
	camera_pivot = get_child(0)

func _physics_process(_delta):
	if player and camera_pivot:
		follow_player()

# moves the camera_pivot node to the player position
func follow_player():
	var target_position = player.global_transform.origin
	
	var current_position = camera_pivot.global_transform.origin
	
	var new_position = current_position.lerp(target_position, follow_speed)
	#Update the camera position
	camera_pivot.global_transform.origin = new_position
