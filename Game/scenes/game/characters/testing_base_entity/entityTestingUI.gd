extends Control

@onready var playerNode: Entity = $"../Player"
var player_model

# Called when the node enters the scene tree for the first time.
func _ready():
	player_model = playerNode.get_node("playerModelWAnim")
	$HealthBar.max_value = playerNode.health_max
	$HealthBar.value = playerNode.health_current
	$EnergyBar.max_value = playerNode.energy_max
	$EnergyBar.value = playerNode.energy_current
	$Position.text = str(playerNode.position)
	$Rotation.text = str(player_model.global_transform.basis.z)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# update progress bars
	$HealthBar.value = playerNode.health_current
	$EnergyBar.value = playerNode.energy_current
	# update positon and rotation
	$Position.text = str(playerNode.position)
	$Rotation.text = str(player_model.global_transform.basis.z)

func get_transform_basis_as_string(basis: Basis):
	return str(basis.x) + ", " + str(basis.y) + ", " + str(basis.z)

func _on_button_apply_damage_pressed():
	playerNode.apply_damage(20)

func _on_button_regen_health_pressed():
	playerNode.health_current = playerNode.health_max
	playerNode.energy_current = playerNode.energy_max


func _on_button_use_ability_pressed():
	playerNode.use_energy(5)
