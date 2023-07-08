extends Control

var num_downgrades = 0

var cards = [
	preload("res://DowngradeSystem/Cards/ReduceMovementSpeed.tscn"),
	preload("res://DowngradeSystem/Cards/ReduceClawDamage.tscn")
]

var halfSprite = preload("res://Assets/Player/Character 2.png")
var babySpirte = preload("res://Assets/Player/Character 1.png")

var Random = RandomNumberGenerator.new()
signal downgrade_selection_finished()

func _ready():
	Random.randomize()
	visible = false
	
func _on_downgrade_selected():
	visible = false
	num_downgrades += 1
	if(num_downgrades == 3):
		$"../../GameCanvasLayer/Player/Sprite2D".set_texture(halfSprite)
	if(num_downgrades == 6):
		$"../../GameCanvasLayer/Player/Sprite2D".set_texture(babySpirte)
	emit_signal("downgrade_selection_finished")
	for card in $DowngradesContainer.get_children():
		card.queue_free()
	
func _on_downgrade_timer_start_downgrade_selection():
	visible = true
	for i in range(3):
		var card = cards[Random.randi_range(0, cards.size()-1)].instantiate()
		card.connect("downgrade_selected", Callable(self, "_on_downgrade_selected"))
		$DowngradesContainer.add_child(card)
