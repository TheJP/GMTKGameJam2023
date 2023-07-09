extends CharacterBody2D

@export var speed = 500

func _ready():
	$Entity.health = PlayerStats.max_health
	GameState.reset()
	PlayerStats.update_player_stats()

func _on_entity_health_changed(old_health, new_health):
	if(new_health < old_health && new_health != PlayerStats.max_health):
		$AnimationPlayer.play("on_damage_taken")
	%GameUI.change_health(new_health, PlayerStats.max_health)
	
	if $Entity.health <= 0:
		GameState.game_over(true)

func _on_corpse_eaten():
	$Entity.health += PlayerStats.health_gain_per_corpse

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

func _process(delta):
	if $Entity.health > 0:
		GameState.score += delta
