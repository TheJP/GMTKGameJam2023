extends Control

var num_downgrades = 0

var cards = [
	preload("res://DowngradeSystem/Cards/ReduceMovementSpeed.tscn"),
	preload("res://DowngradeSystem/Cards/ReduceClawDamage.tscn"),
	preload("res://DowngradeSystem/Cards/ReduceClawSpeed.tscn"),
	preload("res://DowngradeSystem/Cards/ReduceBiteDamage.tscn"),
	preload("res://DowngradeSystem/Cards/ReduceBiteSpeed.tscn"),
	preload("res://DowngradeSystem/Cards/ReduceBiteRange.tscn"),
	preload("res://DowngradeSystem/Cards/ReduceClawRange.tscn"),
	preload("res://DowngradeSystem/Cards/ReduceCorpseHeal.tscn"),
	preload("res://DowngradeSystem/Cards/ReduceScariness.tscn"),
]

var card_counts = []

var halfSprite = preload("res://Assets/Player/Character 2.png")
var babySpirte = preload("res://Assets/Player/Character 1.png")

var Random = RandomNumberGenerator.new()
signal downgrade_selection_finished()

func _ready():
	for card in cards:
		card_counts.append(0)
	Random.randomize()
	visible = false

func _process(delta):
	%GameUI.change_time($Timer.time_left, $Timer.wait_time)

func _on_downgrade_selected(index):
	card_counts[index] += 1
	get_tree().paused = false
	visible = false
	num_downgrades += 1
	if(num_downgrades == 3):
		PlayerStats.monster_form = PlayerStats.MonsterForm.HALF_MONSTER
		AudioController.get_node("duskwolf").play()
		%Player/Sprite2D.play("character2")
		PlayerStats.scariness -= 1
		PlayerStats.update_player_stats()
	if(num_downgrades == 6):
		PlayerStats.monster_form = PlayerStats.MonsterForm.BABY
		AudioController.get_node("baby").play()
		%Player/Sprite2D.play("character3")
		PlayerStats.scariness = 0
		PlayerStats.update_player_stats()
	emit_signal("downgrade_selection_finished")
	$Timer.start()
	for card in $DowngradesContainer.get_children():
		card.queue_free()

func _on_timer_timeout():
	if(num_downgrades < 14):
		get_tree().paused = true
		visible = true
		for i in range(3):
			var index = Random.randi_range(0, cards.size()-1)
			while(card_counts[index] >= 2):
				index = Random.randi_range(0, cards.size()-1)
			var card = cards[index].instantiate()
			card.index = index
			card.connect("downgrade_selected", Callable(self, "_on_downgrade_selected"))
			$DowngradesContainer.add_child(card)
