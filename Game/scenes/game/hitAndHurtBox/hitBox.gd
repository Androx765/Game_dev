class_name HitBox
extends Area3D

@export var damage = 1

func _init():
	collision_layer = 2
	collision_mask = 0
