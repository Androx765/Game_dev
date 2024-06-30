extends TextureButton
var current_menu  = "" 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_toggled(toggled_on):
	var siblings = self.get_parent().get_children()
	var children = self.get_children()
	
	if(toggled_on):
		modulate.a = 0.5
		for sibling in siblings:
			sibling.visible = false
		visible = true # self becomes sibling but we dont want to turn this one off
		
		for child in children:
			child.visible = false
	else:
		modulate.a = 1
		for sibling in siblings:
			sibling.visible = true
		for child in children:
			child.visible = true
	pass # Replace with function body.


func _on_camera_pressed():
	current_menu = "camera"
	pass # Replace with function body.


func _on_smthing_else_pressed():
	current_menu = "smthing_else_pressed"
	pass # Replace with function body.
