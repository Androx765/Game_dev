extends ActiveAbility


func execute(entity: Entity, direction = null):
	if entity.energy_current >= 20:
		print(entity.name + " casts FIRE")
		entity.use_energy(20)
	else:
		print(entity.name + " cannot cast FIRE, ICH HAB KEIN MANA MEHR")

# Called when the node enters the scene tree for the first time.
func _ready():
	energy_cost = 20
	damage = 4
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
