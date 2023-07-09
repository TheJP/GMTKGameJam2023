extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var lair = get_node("/root/Game/GameCanvasLayer/Buildings/MonsterLair").global_position
	var player = get_node("/root/Game/GameCanvasLayer/Player/Camera2D").global_position
	var direction = lair - player
	var viewport_rect = get_viewport().get_visible_rect()
	var top_left = viewport_rect.position
	var top_right = top_left + Vector2(viewport_rect.size.x, 0)
	var bottom_right = viewport_rect.end
	var bottom_left = top_left + Vector2(0, viewport_rect.size.y)
	var mid_point = viewport_rect.size / 2
	var top = intersect(top_left, top_right, mid_point, mid_point + direction)
	var left = intersect(top_left, bottom_left, mid_point, mid_point + direction)
	var bottom = intersect(bottom_left, bottom_right, mid_point, mid_point + direction)
	var right = intersect(top_right, bottom_right, mid_point, mid_point + direction)
	
# Gets the intersection between the two line-segments defined by p1,p2 and p3,p4
func intersect(p1: Vector2, p2: Vector2, p3: Vector2, p4: Vector2):
	var x1 = p1.x
	var y1 = p1.y
	var x2 = p2.x
	var y2 = p2.y 
	var x3 = p3.x
	var y3 = p3.y
	var x4 = p4.y
	var y4 = p4.y 
	
	var denom = (y4-y3)*(x2-x1) - (x4-x3)*(y2-y1)
	if (denom == 0): # parallel
		return null
	var ua = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / denom
	if (ua < 0 or ua > 1): # out of range
		return null
	var ub = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / denom
	if (ub < 0 or ub > 1): # out of range
		return null
		
	var x = x1 + ua * (x2-x1)
	var y = y1 + ua * (y2-y1)
	return Vector2(x,y)
