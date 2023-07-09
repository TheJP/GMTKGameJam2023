extends Node

@export var movement_speed = 500
@export var liferegeneration = 1
@export var claw_attack_speed = 1
@export var bite_attack_speed = 3
@export var claw_damage = 50
@export var bite_damage = 50
@export var claw_range = 200
@export var bite_range = 150
@export var scariness = 10
@export var max_health = 100
@export var health_gain_per_corpse = 10

func update_player_stats():
	$"../Game/GameCanvasLayer/YSortNode/Player".speed = movement_speed
	$"../Game/GameCanvasLayer/YSortNode/Player/AttackClaws".damage = claw_damage
	$"../Game/GameCanvasLayer/YSortNode/Player/AttackClaws/Timer".start(claw_attack_speed)
	$"../Game/GameCanvasLayer/YSortNode/Player/AttackBite".damage = bite_damage
	$"../Game/GameCanvasLayer/YSortNode/Player/AttackBite/Timer".start(bite_attack_speed )
	$"../Game/GameCanvasLayer/YSortNode/Player/AttackBite/Area2D/CollisionShape2D".shape.radius = bite_range
	$"../Game/GameCanvasLayer/YSortNode/Player/AttackClaws/Area2D/CollisionShape2D".shape.radius = claw_range

