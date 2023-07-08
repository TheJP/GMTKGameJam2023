class_name Entity
extends Node

signal health_changed(new_health: int)

@export var health = 100 : set = on_health_changed

func on_health_changed(new_health):
	health = new_health
	health_changed.emit(new_health)
