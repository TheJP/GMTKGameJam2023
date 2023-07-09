extends Node2D

@export var projectileRessource = preload("res://Enemy/stoneProjectile.tscn")

func _on_attack_enemy_damage_target(body):
	var projectile = projectileRessource.instantiate()
	get_tree().root.get_node("Game/GameCanvasLayer/YSortNode/Enemies").add_child(projectile)
	projectile.target = body
	projectile.global_position = global_position
