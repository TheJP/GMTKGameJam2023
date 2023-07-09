extends CanvasLayer
@onready var animation_player = $AnimationPlayer

func fade_to_black():
	animation_player.play("fade_to_black")
	await animation_player.animation_finished

func fade_to_normal():
	animation_player.play("fade_to_normal")
	await animation_player.animation_finished

func transition():
	animation_player.play("fade_to_black")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		$AnimationPlayer.play("fade_to_normal")

