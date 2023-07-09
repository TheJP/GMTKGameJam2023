extends Node

var animation = preload("res://player/bite_animation.tscn")

func _on_attack_damage_target(body: PhysicsBody2D):
	AudioController.get_node("bite").play()
	var attack = animation.instantiate()
	attack.position = body.position
	add_child(attack)
