extends RichTextLabel

var remainingSeconds = 30
signal start_downgrade_selection()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if remainingSeconds <= 0:
		emit_signal("start_downgrade_selection")
		$Timer.stop()
		remainingSeconds = 30
	set_text(str(remainingSeconds))

func _on_timer_timeout():
	remainingSeconds -= 1

func _on_downgrades_downgrade_selection_finished():
	$Timer.start()
