extends Control

@onready var playerNode: Entity = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready():
	$HealthBar.max_value = playerNode.health_max
	$HealthBar.value = playerNode.health_current
	$EnergyBar.max_value = playerNode.energy_max
	$EnergyBar.value = playerNode.energy_current

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# update progress bars
	$HealthBar.value = playerNode.health_current
	$EnergyBar.value = playerNode.energy_current


func _on_button_apply_damage_pressed():
	playerNode.apply_damage(20)


func _on_button_regen_health_pressed():
	playerNode.regen_health()
	playerNode.regen_energy()


func _on_button_use_ability_pressed():
	playerNode.use_energy(5)
