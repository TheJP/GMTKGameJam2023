extends CharacterBody2D

func _on_entity_health_changed(new_health):
	if (new_health < 0):
		$DeathBehaviour.on_death()
