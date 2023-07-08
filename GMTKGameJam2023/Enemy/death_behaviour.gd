class_name DeathBehaviour

extends Node

func on_death():
	get_parent().queue_free()
