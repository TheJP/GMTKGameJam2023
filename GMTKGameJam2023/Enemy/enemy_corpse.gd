extends Sprite2D

signal corpse_eaten

@export var eaten_texture : Texture
@onready var player = get_tree().root.get_node("Game/GameCanvasLayer/YSortNode/Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("corpse_eaten", player._on_corpse_eaten)

func _on_area_2d_body_entered(_body):
	if player.get_node("Entity").health >= PlayerStats.max_health:
		return

	$AnimationPlayer.play("RESET")
	$CPUParticles2D.visible = false
	$CPUParticles2D.emitting = false
	corpse_eaten.emit()
	texture = eaten_texture
	$Area2D.set_deferred("monitorable", false)
	$Area2D.set_deferred("monitoring", false)
	$Container.queue_free()
