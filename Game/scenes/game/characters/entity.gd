class_name Entity 

extends CharacterBody3D 

# base stats
var health_max: int
var health_current: int
var health_temp: int
var health_regen: int
var armor: int

var energy_max: int
var energy_current: int
var energy_regen: int

#var resistances: Dictionary

# movement stats
var direction: Vector2
var speed_max: float
var speed_current: float
var acceleration: float
var agility: int # how fast can you turn

var is_busy: bool # is attacking / using ability
var is_moving: bool

func setup_base_stats(health: int, energy: int):
	health_current = health
	health_max = health
	health_regen = health / 10
	energy_current = energy
	energy_max = energy
	energy_regen = energy / 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

## regenerate health by adding the regen amount
func regen_health():
	if health_current < health_max:
		health_current += health_regen
		if health_current > health_max:
			health_current = health_max

## regenerate health by adding the regen amount
func regen_energy():
	if energy_current < energy_max:
		energy_current += energy_regen
		if energy_current > energy_max:
			energy_current = energy_max

func use_energy(amount: int):
	energy_current -= amount
	if energy_current < 0:
		energy_current = 0

## apply damage to node, amount of damage received depends on amount of damage and its damage type
func apply_damage(amount: int):
	var amount_rest = amount
	# entity has still armor, remove from armor
	while amount > 0 && armor > 0: 
		apply_damage_to_armor()
		amount -= 1
	# remove from health
	while amount > 0 && health_current > 0:
		apply_damage_to_health()
		amount -= 1

func apply_damage_to_armor():
	armor -= 1

func apply_damage_to_health():
	health_current -= 1

func load_ability(ability: String):
	var scene = load("res://scenes/game/abilities/" + ability + "/" + ability + ".tscn")
	var ability_node = scene.instantiate()
	add_child(ability_node)
	ability_node.position = position
	ability_node.velocity = ability_node.velocity.rotated(ability_node.rotation.normalized(), 0)
	return ability_node
