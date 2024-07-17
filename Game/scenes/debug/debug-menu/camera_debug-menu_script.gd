extends Node2D

var x_rotation = 0
var y_rotation = 0
var z_rotation = 0

var test = "neu"
var cameraPivot = null
var cameraObject = null

var speed = 0.001
# Called when the node enters the scene tree for the first time.
func _ready():
	x_rotation = CameraGlobal.OrgRotation.x
	y_rotation = CameraGlobal.OrgRotation.y
	z_rotation = CameraGlobal.OrgRotation.z
	$x/xValue.text = str(x_rotation) 
	$y/yValue.text = str(y_rotation)
	$z/zValue.text = str(z_rotation)
	
	cameraPivot = CameraGlobal.CameraPivot
	cameraObject = CameraGlobal.CameraObject
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(cameraObject != null):
		cameraObject.rotate_x(x_rotation)
		cameraPivot.rotate_y(y_rotation)
		cameraObject.rotate_z(z_rotation)
		
	if ($x/xDown.button_pressed):
		$x/xValue.text = str(float($x/xValue.text) -speed) 
		x_rotation = float($x/xValue.text)
	
	if ($y/yDown.button_pressed):
		$y/yValue.text = str(float($y/yValue.text) -speed) 
		y_rotation = float($y/yValue.text)
		
	if ($z/zDown.button_pressed):
		$z/zValue.text = str(float($z/zValue.text) -speed) 
		z_rotation = float($z/zValue.text)
		
	if ($x/xUp.button_pressed):
		$x/xValue.text = str(float($x/xValue.text) +speed) 
		x_rotation = float($x/xValue.text)
	
	if ($y/yUp.button_pressed):
		$y/yValue.text = str(float($y/yValue.text) +speed) 
		y_rotation = float($y/yValue.text)
		
	if ($z/zUp.button_pressed):
		$z/zValue.text = str(float($z/zValue.text) +speed) 
		z_rotation = float($z/zValue.text)
	pass
	
	
func _on_x_value_text_changed():
	x_rotation = float($x/xValue.text)
	pass 

func _on_y_value_text_changed():
	y_rotation = float($y/yValue.text)
	pass 

func _on_z_value_text_changed():
	z_rotation = float($z/zValue.text)
	pass 



