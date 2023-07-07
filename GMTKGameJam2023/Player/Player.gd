extends Node2D

@export var speed = 500

func _ready():
	pass # Replace with function body.

func _process(delta):
	var move = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		move.x += 1
	if Input.is_action_pressed("move_left"):
		move.x -= 1
	if Input.is_action_pressed("move_down"):
		move.y += 1
	if Input.is_action_pressed("move_up"):
		move.y -= 1

	if move.length_squared() > 0:
		position += move.normalized() * speed * delta
