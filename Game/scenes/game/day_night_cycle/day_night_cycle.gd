extends Node3D

@onready var directionalLight = $DirectionalLight3D

@export var sun_rotation_speed: float = 0.05

func _process(delta):
	directionalLight.rotation.x += sun_rotation_speed * delta
	if (directionalLight.rotation.x >= 360):
		directionalLight.rotation.x = 0

