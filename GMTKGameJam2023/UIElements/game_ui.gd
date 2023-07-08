extends MarginContainer

func change_health(new_health: int, max_health: int):
	%HealthBar.max_value = max_health
	%HealthBar.value = new_health

func change_time(new_time: float, max_time: float):
	%TimeBar.max_value = max_time
	%TimeBar.value = new_time
