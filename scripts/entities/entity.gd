extends CharacterBody3D
class_name Entity

var direction : Vector2 = Vector2()

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

var max_speed : float = 200
var current_speed : float = 0
var acceleration : float = 4

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
	move_and_slide()
	
	

func load_ability(name: String):
	var scene = load("res://scenes/abilities/" + name + "/" + name + ".tscn")
	
	var sceneNode = scene.instantiate()
	add_child(sceneNode)
	return sceneNode
