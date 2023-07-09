extends Node

var animation = preload("res://player/claw_animation.tscn")

func _on_attack_damage_target(body: PhysicsBody2D):
	var attack = animation.instantiate()

	attack.position = body.position
	add_child(attack)
