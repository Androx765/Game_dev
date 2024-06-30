extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_toggled(toggled_on):
	var children = self.get_children()
		
	if(toggled_on):
		for child in children:
			child.visible = false
	else:
		for child in children:
			child.visible = true
	pass # Replace with function body.
