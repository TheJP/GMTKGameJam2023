extends Node

var animation = preload("res://Player/claw_animation.tscn")

func _on_attack_damage_target(body: PhysicsBody2D):
	var attack = animation.instantiate()

	attack.position = body.position
	AudioController.get_node("slash").play()

	if (PlayerStats.monster_form == PlayerStats.MonsterForm.BABY):
		attack.get_node("ClawAnimation").play("fist_anim")

	else:
		attack.get_node("ClawAnimation").play("claw_attack_fade_in")

	add_child(attack)
