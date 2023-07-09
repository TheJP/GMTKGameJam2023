extends Sprite2D

signal corpse_eaten

@export var eaten_texture : Texture

# Called when the node enters the scene tree for the first time.
func _ready():
	var player = get_tree().root.get_node("Game/GameCanvasLayer/YSortNode/Player")
	connect("corpse_eaten", player._on_corpse_eaten)


func _on_area_2d_body_entered(body):
	$AnimationPlayer.play("RESET")
	$CPUParticles2D.visible = false
	$CPUParticles2D.emitting = false
	scale.x = -scale.x 
	corpse_eaten.emit()
	texture = eaten_texture
	$Area2D.monitorable = false
	$Area2D.monitoring = false
	
