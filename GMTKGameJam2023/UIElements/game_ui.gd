extends MarginContainer

## Player Node used for its position to correctly display the direction indicator.
@export var player: Node2D

## MonsterLair Node used for its position to correctly display the direction indicator.
@export var monster_lair: Node2D

func change_health(new_health: int, max_health: int):
	%HealthBar.max_value = max_health
	%HealthBar.value = new_health

func change_time(new_time: float, max_time: float):
	%TimeBar.max_value = max_time
	%TimeBar.value = new_time

func _process(_delta):
	%ScoreText.text = ("Score: %.1f" % GameState.score)
