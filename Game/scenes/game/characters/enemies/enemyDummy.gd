extends Entity

@export var startHealth = 10
var health

func _ready():
	health_max = 10
	health_current = health_max
	#health = startHealth

func _process(delta):
	if (health_current <= 0):
		print("You clapped the Dummy")
		health_current = health_max

func take_damage(amount: int):
	print("Damage: ", amount)
	health_current -= amount
