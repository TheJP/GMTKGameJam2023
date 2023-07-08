extends Node2D

@export var enemy : Resource

func _ready():
	spawn_enemy()

func _on_spawn_timer_timeout():
	spawn_enemy()

func spawn_enemy():
	var spawned_enemy = enemy.instantiate()
	get_tree().root.get_node("Game/GameCanvasLayer/YSortNode/Enemies").add_child(spawned_enemy)
	spawned_enemy.player = get_tree().root.get_node("Game/GameCanvasLayer/YSortNode/Player")
	spawned_enemy.global_position = global_position
