extends Node2D

signal damage_target(body: PhysicsBody2D)

@export var attack_player = false
@export var attack_enemy = false

## Determines if the attack deals damage to multiple opponents if they are in range.
@export var is_aoe = false

@export var damage = 10

var attack_ready = true

func _ready():
	pass

func _process(delta):
	if not attack_ready:
		return

	for body in $Area2D.get_overlapping_bodies():
		var should_attack = \
			(attack_player and body.is_in_group("player")) or \
			(attack_enemy and body.is_in_group("enemy"))
		if should_attack:
			deal_damage(body)
			attack_ready = false
			$Timer.start()
			if not is_aoe:
				return

func deal_damage(body: PhysicsBody2D):
	if not body.has_node("Entity") or not body.get_node("Entity") is Entity:
		return
	
	var entity: Entity = body.get_node("Entity")
	entity.health -= damage
	emit_signal("damage_target", body)

func _on_timer_timeout():
	attack_ready = true
