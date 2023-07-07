extends CharacterBody2D

@export var speed = 500

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
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

func _process(delta):
	pass
