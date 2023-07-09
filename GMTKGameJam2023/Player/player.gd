extends CharacterBody2D

@export var speed = 500

func _ready():
	$Entity.health = PlayerStats.max_health
	GameState.reset()
	PlayerStats.update_player_stats()

func _on_entity_health_changed(old_health, new_health):
	if(new_health > PlayerStats.max_health):
		$Entity.health = PlayerStats.max_health
		return

	if(new_health < old_health && new_health != PlayerStats.max_health):
		$AnimationPlayer.play("on_damage_taken")
		AudioController.get_node("monster").play()

	%GameUI.change_health(new_health, PlayerStats.max_health)

	if new_health <= 0:
		GameState.game_over(true)

func _on_corpse_eaten():
	AudioController.get_node("monster eating").play()
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
	if move == Vector2.ZERO:
		$Sprite2D.pause()
	elif not $Sprite2D.is_playing():
		if PlayerStats.monster_form == PlayerStats.MonsterForm.MONSTER:
			$Sprite2D.play("character1")
		if PlayerStats.monster_form == PlayerStats.MonsterForm.HALF_MONSTER:
			$Sprite2D.play("character2")
		if PlayerStats.monster_form == PlayerStats.MonsterForm.BABY:
			$Sprite2D.play("character3")

func _process(delta):
	if $Entity.health > 0:
		GameState.score += delta

func _on_target_hit():
	$AnimationPlayer.play("on_damage_taken")
