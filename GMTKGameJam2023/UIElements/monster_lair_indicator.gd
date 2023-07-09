extends TextureRect

const MARGIN = Vector2(50, 65)
const INDICATOR_SIZE = Vector2(100, 150)

func _process(delta):
	var is_on_screen: bool = owner.monster_lair.is_on_screen()
	visible = not is_on_screen
	if is_on_screen:
		return

	var player: Vector2 = owner.player.global_position
	var monster_lair: Vector2 = owner.monster_lair.global_position
	var viewport: Rect2 = get_viewport_rect()
	viewport.size -= MARGIN + INDICATOR_SIZE

	var direction: Vector2 = monster_lair - player
	direction = direction.normalized()
	var ray_start: Vector2 = viewport.get_center()
	var ray_end: Vector2 = ray_start + ((viewport.size.x + viewport.size.y) * direction)

	$Arrow.rotation = atan2(direction.y, direction.x)

	var viewport_sides: Array[Array] = [
		[viewport.position, Vector2(viewport.end.x, viewport.position.y)], # top
		[viewport.position, Vector2(viewport.position.x, viewport.end.y)], # left
		[Vector2(viewport.end.x, viewport.position.y), viewport.end], # right
		[Vector2(viewport.position.x, viewport.end.y), viewport.end], # bottom
	]

	for side in viewport_sides:
		var intersection = Geometry2D.segment_intersects_segment(ray_start, ray_end, side[0], side[1])
		if intersection == null:
			continue

		position = intersection
		break
