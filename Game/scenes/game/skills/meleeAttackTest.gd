extends Node3D

@onready var animation_player = $AnimationPlayer

func attack():
	animation_player.play("meleeAttackTestAnim")
