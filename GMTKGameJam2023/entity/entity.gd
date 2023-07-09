class_name Entity
extends Node

signal health_changed(old_health: int, new_health: int)

@export var health = 500 : set = on_health_changed

func on_health_changed(new_health):
	var old_health = health
	health = new_health
	health_changed.emit(old_health, new_health)

