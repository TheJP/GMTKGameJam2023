extends StaticBody2D

func _on_entity_health_changed(old_health, new_health):
	if new_health <= 0:
		AudioController.get_node("building_destroyed").play()
		$EnemySpawner/SpawnTimer.stop()
		$AnimatedSprite2D.visible = false
		$Sprite2D.visible = true
		remove_from_group("enemy")
