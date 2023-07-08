extends Node2D

@export var enemy : Resource



func _on_spawn_timer_timeout():
	var spawned_enemy = enemy.instantiate()
	get_tree().root.get_node("Game/GameCanvasLayer/Enemies").add_child(spawned_enemy)
	spawned_enemy.player = get_tree().root.get_node("Game/GameCanvasLayer/Player")
	spawned_enemy.global_position = global_position
