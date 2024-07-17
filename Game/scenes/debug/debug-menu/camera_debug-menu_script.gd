extends Node2D


#var test = "neu"
var cameraPivot;
var cameraObject;

var axis;
var rotation_amount;

# Called when the node enters the scene tree for the first time.
func _ready():
	
	rotation_amount = 0.001
	$Label/turnSpeed.text = str(rotation_amount)
	
	cameraPivot = CameraGlobal.CameraPivot
	cameraObject = CameraGlobal.CameraObject
	
	$x/xValue.text = str(cameraObject.rotation_degrees.x)
	$y/yValue.text = str(cameraPivot.rotation_degrees.y)
	$z/zValue.text = str(cameraObject.rotation_degrees.z)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if ($x/xDown.button_pressed):
		axis = Vector3(-1,0,0)
		rotate_on_x(axis, rotation_amount)
	
	if ($y/yDown.button_pressed):
		axis = Vector3(0,-1,0)
		rotate_on_y(axis, rotation_amount)
	
	if ($z/zDown.button_pressed):
		axis = Vector3(0,0,-1)
		rotate_on_z(axis, rotation_amount)
	
	if ($x/xUp.button_pressed):
		axis = Vector3(1,0,0)
		rotate_on_x(axis, rotation_amount)
	
	if ($y/yUp.button_pressed):
		axis = Vector3(0,1,0)
		rotate_on_y(axis, rotation_amount)
		
	if ($z/zUp.button_pressed):
		axis = Vector3(0,0,1)
		rotate_on_z(axis, rotation_amount)
	
	
func _on_x_value_text_changed():
	cameraObject.transform.basis = Basis(Vector3(1,0,0), deg_to_rad(float($x/xValue.text)))

func _on_y_value_text_changed():
	cameraPivot.transform.basis = Basis(Vector3(0,1,0), deg_to_rad(float($y/yValue.text)))

func _on_z_value_text_changed():
	cameraObject.transform.basis = Basis(Vector3(0,0,1), deg_to_rad(float($z/zValue.text)))

func rotate_on_x(axis, rotation_amount):
	cameraObject.transform.basis = Basis(axis, rotation_amount) * cameraObject.transform.basis
	$x/xValue.text = str(cameraObject.rotation_degrees.x)

func rotate_on_y(axis, rotation_amount):
	cameraPivot.transform.basis = Basis(axis, rotation_amount) * cameraPivot.transform.basis
	$y/yValue.text = str(cameraPivot.rotation_degrees.y)

func rotate_on_z(axis, rotation_amount):
	cameraObject.transform.basis = Basis(axis, rotation_amount) * cameraObject.transform.basis
	$z/zValue.text = str(cameraObject.rotation_degrees.z)


func _on_turn_speed_text_changed():
	rotation_amount = float($Label/turnSpeed.text)
	pass # Replace with function body.
