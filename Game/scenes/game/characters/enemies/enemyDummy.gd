extends Node3D

@export var startHealth = 10
var health

func _ready():
	health = startHealth

func _process(_delta):
	if (health <= 0):
		print("You clapped the Dummy")
		health = startHealth

func take_damage(amount: int):
	print("Damage: ", amount)
	health -= amount
