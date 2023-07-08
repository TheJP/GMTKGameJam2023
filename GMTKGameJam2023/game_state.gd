extends Node

@export var score: float = 0
@export var has_died: bool = false

func reset():
	score = 0
	has_died = false

func game_over(player_has_died: bool):
	self.has_died = player_has_died
	await TransitionScreen.fade_to_black()
	get_tree().change_scene_to_file("res://UIElements/game_over.tscn")
	TransitionScreen.fade_to_normal()
