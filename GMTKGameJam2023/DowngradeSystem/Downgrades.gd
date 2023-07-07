extends Control

var Random = RandomNumberGenerator.new()

func _ready():
	Random.randomize()
	visible = true
	_on_downgrade()

#handles randomly selecting the downgrades
func _on_downgrade():
	for i in range(3):
		var card = preload("res://DowngradeSystem/DowngradeCard.tscn").instantiate()
		card.connect("downgrade_selected", Callable(self, "_on_downgrade_selected"))
		$DowngradesContainer.add_child(card)
		
func _on_downgrade_selected():
	for card in $DowngradesContainer.get_children():
		card.queue_free()
	
