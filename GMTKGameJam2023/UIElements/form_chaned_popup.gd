extends CenterContainer

var popup_was_shown: bool = false

func _process(delta):
	if not popup_was_shown and PlayerStats.monster_form != PlayerStats.MonsterForm.MONSTER:
		popup_was_shown = true
		visible = true
		%FormChangedPopUpCloseButton.grab_focus()
		get_tree().paused = true

func _on_form_changed_pop_up_close_button_pressed():
	visible = false
	get_tree().paused = false
