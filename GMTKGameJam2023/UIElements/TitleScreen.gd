extends Control

@onready var start_game_button = %"StartGameButton"

func _ready():
	start_game_button.grab_focus()
	AudioController.get_node("ambience").play()

func _on_start_game_button_pressed():
	get_tree().paused = true
	await TransitionScreen.fade_to_black()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main.tscn")
	TransitionScreen.fade_to_normal()

func _process(delta):
	if Input.is_action_pressed("start"):
		_on_start_game_button_pressed()
