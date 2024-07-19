extends ActiveAbility

# Called when the node enters the scene tree for the first time.
func _ready():
	# setup base stats
	energy_cost = 20
	damage = 4
	animation = "dance2"
	speed = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

## execute this ability from [entity] in [direction]
func execute(entity: Entity, direction = null, start_point = null):
	source_entity = entity
	source_direction = direction
	# set start point if given
	if start_point != null:
		position = start_point
	# if enough energy, fire ability
	if entity.energy_current >= energy_cost:
		fire_ability()
		entity.use_energy(energy_cost)
	else:
		print(entity.name + " cannot cast FIRE: ICH HAB KEIN MANA MEHR")

func fire_ability():
	look_at(source_direction)
	direction_of_travel = rotation
	print(source_entity.name + " casts FIRE in direction " + str(rotation) + "\nwith start " + str(position))
	#source_entity.anim_state.travel(animation)
	
func _physics_process(delta):
	position += velocity * delta * speed
