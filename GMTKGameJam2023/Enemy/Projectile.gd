extends Sprite2D

var speed = 1000
var target = null

signal target_hit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(target):
		var player = get_tree().get_nodes_in_group("player")[0]
		look_at(target.global_position)
		global_position = global_position.move_toward(target.global_position, speed * delta)
		if((global_position - target.global_position).length() < 10):
			self.connect("target_hit", Callable(player, "_on_target_hit"))
			emit_signal("target_hit")
			self.queue_free()
