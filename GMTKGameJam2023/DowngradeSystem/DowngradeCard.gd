extends NinePatchRect

signal downgrade_selected()

var index = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_gui_input(event):
	if Input.is_action_pressed("select_downgrade"):
		AudioController.get_node("click").play()
		$Effect.apply_downgrade()
		downgrade_selected.emit(index)

func _on_mouse_entered():
	self_modulate = Color(0.8, 0.8, 0.8)

func _on_mouse_exited():
	self_modulate = Color(1, 1, 1)
