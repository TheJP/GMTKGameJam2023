extends Node

@export var movement_speed = 500
@export var liferegeneration = 1
@export var claw_attack_speed = 1
@export var bite_attack_speed = 3
@export var claw_damage = 1
@export var bite_damage = 1
@export var claw_range = 200
@export var bite_range = 150
@export var scariness = 1
@export var max_health = 100

func update_player_stats():
	$"../Game/GameCanvasLayer/Player".speed = movement_speed
	$"../Game/GameCanvasLayer/Player/AttackClaws".damage = claw_damage
	$"../Game/GameCanvasLayer/Player/AttackClaws/Timer".start(claw_attack_speed)
	$"../Game/GameCanvasLayer/Player/AttackBite".damage = bite_damage
	$"../Game/GameCanvasLayer/Player/AttackBite/Timer".start(bite_attack_speed )
	$"../Game/GameCanvasLayer/Player/AttackBite/Area2D/CollisionShape2D".shape.radius = bite_range
	$"../Game/GameCanvasLayer/Player/AttackClaws/Area2D/CollisionShape2D".shape.radius = claw_range

