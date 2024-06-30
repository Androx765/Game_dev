extends Node2D

var x_rotation = 45
var y_rotation = 45
var z_rotation = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$x/xValue.text = str(x_rotation) #TODO actual camera rotation
	$y/yValue.text = str(y_rotation) #TODO actual camera rotation
	$z/zValue.text = str(z_rotation) #TODO actual camera rotation
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(x_rotation)
	pass
	
	
func _on_x_value_text_changed():
	x_rotation = float($x/xValue.text)
	pass 
func _on_x_down_button_down():
	$x/xValue.text = str(float($x/xValue.text) -.5) 
	x_rotation = float($x/xValue.text)
	pass
func _on_x_up_button_down():
	$x/xValue.text = str(float($x/xValue.text) +.5) 
	x_rotation = float($x/xValue.text)
	pass



func _on_y_value_text_changed():
	y_rotation = float($y/yValue.text)
	pass 
func _on_y_down_button_down():
	$y/yValue.text = str(float($y/yValue.text) -.5) 
	y_rotation = float($y/yValue.text)
	pass
func _on_y_up_button_down():
	$y/yValue.text = str(float($y/yValue.text) +.5) 
	y_rotation = float($y/yValue.text)
	pass
	
	

func _on_z_value_text_changed():
	z_rotation = float($z/zValue.text)
	pass 
func _on_z_down_button_down():
	$z/zValue.text = str(float($z/zValue.text) -.5) 
	z_rotation = float($z/zValue.text)
	pass
func _on_z_up_button_down():
	$z/zValue.text = str(float($z/zValue.text) +.5) 
	z_rotation = float($z/zValue.text)
	pass
