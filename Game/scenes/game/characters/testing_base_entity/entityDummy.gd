extends Entity


# Called when the node enters the scene tree for the first time.
func _ready():
	# initialize stats
	health_max = 100
	health_current = health_max
	energy_max = 100
	energy_current = energy_max


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
