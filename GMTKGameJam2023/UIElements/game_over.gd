extends CenterContainer

func _ready():
	%MainMenuButton.grab_focus()
	if not GameState.has_died:
		%GameOverSubtitleText.text = ("You lived!\nYour score is: %.1f" % GameState.score)

func _on_button_pressed():
	AudioController.get_node("click").play()
	await TransitionScreen.fade_to_black()
	get_tree().change_scene_to_file("res://titleScreen.tscn")
	TransitionScreen.fade_to_normal()
