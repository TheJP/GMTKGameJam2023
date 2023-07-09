extends CharacterBody2D

@export var speed : int = 100
@export var player : CharacterBody2D
@export var bravery: int = 5

@export var angrySprite = preload("res://Assets/Enemy/Enemy_A_Attack.png")
@export var scaredSprite = preload("res://Assets/Enemy/Enemy_A_Shy.png")

var scared = true

func _physics_process(delta: float):
	move_and_slide()

func _on_entity_health_changed(health, new_health):
	if (new_health <= 0):
		$DeathBehaviour.on_death()


func _on_direction_timer_timeout():
	var dir =  global_position.direction_to(player.global_position)
	
	if(scared and bravery >= PlayerStats.scariness):
		scared = false
		$Sprite2D.set_texture(angrySprite)

	if(scared):
		dir *= -1
	velocity = dir * 100
