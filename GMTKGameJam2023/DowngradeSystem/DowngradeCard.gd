extends NinePatchRect

signal downgrade_selected()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_gui_input(event):
	if Input.is_action_pressed("SelectDowngrade"):
		emit_signal("downgrade_selected")

func _on_mouse_entered():
	self_modulate = Color(0.8, 0.8, 0.8)

func _on_mouse_exited():
	self_modulate = Color(1, 1, 1)
