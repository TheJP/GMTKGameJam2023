extends Control

var Random = RandomNumberGenerator.new()
signal downgrade_selection_finished()

func _ready():
	Random.randomize()
	visible = false
	
func _on_downgrade_selected():
	visible = false
	emit_signal("downgrade_selection_finished")
	for card in $DowngradesContainer.get_children():
		card.queue_free()
	
func _on_downgrade_timer_start_downgrade_selection():
	visible = true
	for i in range(3):
		var card = preload("res://DowngradeSystem/DowngradeCard.tscn").instantiate()
		card.connect("downgrade_selected", Callable(self, "_on_downgrade_selected"))
		$DowngradesContainer.add_child(card)
