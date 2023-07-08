extends CharacterBody2D

@export var speed = 500

func _ready():
	$Entity.health = PlayerStats.max_health

func _on_entity_health_changed(new_health):
	%GameUI.change_health(new_health, PlayerStats.max_health)

func _physics_process(_delta):
	var move = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		move.x += 1
	if Input.is_action_pressed("move_left"):
		move.x -= 1
	if Input.is_action_pressed("move_down"):
		move.y += 1
	if Input.is_action_pressed("move_up"):
		move.y -= 1

	velocity = move.normalized() * speed
	move_and_slide()
