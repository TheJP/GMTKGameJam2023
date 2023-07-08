extends StaticBody2D

func _on_entry_area_2d_body_entered(body: PhysicsBody2D):
	if body.is_in_group("player"):
		get_tree().paused = true
		$AcceptDialog.show()

func _on_accept_dialog_canceled():
	get_tree().paused = false

func _on_accept_dialog_confirmed():
	await TransitionScreen.fade_to_black()
	get_tree().change_scene_to_file("res://UIElements/game_over.tscn")
	TransitionScreen.fade_to_normal()
	get_tree().paused = false
