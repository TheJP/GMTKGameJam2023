extends StaticBody2D

var tree_texures = [preload("res://Assets/Trees/Tree_A.png"), preload("res://Assets/Trees/Tree_B.png")]
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.texture = tree_texures[rng.randi_range(0, 1)]

