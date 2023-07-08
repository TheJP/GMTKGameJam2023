extends Node

@export var movement_speed = 500
@export var liferegeneration = 1
@export var claw_attack_speed = 1
@export var bite_attack_speed = 3
@export var claw_damage = 1
@export var bite_damage = 1
@export var claw_range = 1
@export var bite_range = 1
@export var scariness = 1

func initialize_player_stats():
	$"../GameCanvasLayer/Player".speed = movement_speed
	$"../GameCanvasLayer/Player/AttackClaws".damage = claw_damage
	$"../GameCanvasLayer/Player/AttackClaws/Timer".start(claw_attack_speed)
	$"../GameCanvasLayer/Player/AttackBite".damage = bite_damage
	$"../GameCanvasLayer/Player/AttackBite/Timer".start(bite_attack_speed )
	

