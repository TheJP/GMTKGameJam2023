extends CharacterBody2D

@export var speed : int = 100
@export var player : CharacterBody2D
@onready var nav_agent = $NavigationAgent2D as NavigationAgent2D

func _physics_process(delta: float):
	move_and_slide()

func _on_entity_health_changed(new_health):
	if (new_health < 0):
		$DeathBehaviour.on_death()


func _on_direction_timer_timeout():
	var dir =  global_position.direction_to(player.global_position)
	velocity = dir * 100
