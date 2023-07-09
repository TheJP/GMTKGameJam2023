extends DeathBehaviour

var enemy_corpse = preload("res://Enemy/enemy_corpse.tscn")
@export var corpse_texture : Texture
@export var corpse_eaten_texture : Texture


func on_death():
	var corpse = enemy_corpse.instantiate()
	get_tree().root.get_node("Game/GameCanvasLayer/YSortNode/Corpses").add_child(corpse)
	corpse.global_position = get_parent().global_position - Vector2(0, 20)
	corpse.eaten_texture = corpse_eaten_texture
	corpse.texture = corpse_texture
	super.on_death()
