extends DeathBehaviour

var enemy_corpse = preload("res://Enemy/enemy_corpse.tscn")
@export var corpse_texture : Texture

func on_death():
	var corpse = enemy_corpse.instantiate()
	get_tree().root.get_node("Game/GameCanvasLayer/Corpses").add_child(corpse)
	corpse.global_position = get_parent().global_position
	super.on_death()
