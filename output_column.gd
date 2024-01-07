
class_name RectPack2DOutputColumn extends RectPack2DOutputGrid


var left_neighbor: RectPack2DOutputColumn = null


func get_width() -> float:
	var width := 0.0
	for rect_size in rect_sizes:
		width = maxf(width, rect_size.x)
	return width


func get_height() -> float:
	var height: float = 0
	for i in range(rect_sizes.size()):
		if i > 0: height += packer.margin.y
		height += rect_sizes[i].y
	return height


func can_fit(rect_size: Vector2) -> bool:
	if packer.max_height > 0 and packer.expand_type != RectPack2D.Expand.VERTICAL:
		return get_height() + packer.margin.y + rect_size.y < packer.max_height
	return true


func get_x_position() -> float:
	if left_neighbor:
		return left_neighbor.get_x_position() + left_neighbor.get_width() + packer.margin.x
	return 0.0


## Assumes the rect is starting from the top left. Aligns based on [member inner_alignment] (only horizontal alignment applies)
func align_rect(rect: Rect2) -> Rect2:
	var start_x := rect.position.x
	if packer.inner_alignment & RectPack2D.CENTER: rect.position.x = start_x + ((get_width() - rect.size.x) / 2)
	if packer.inner_alignment & RectPack2D.RIGHT: rect.position.x = start_x + (get_width() - rect.size.x)
	return rect


func get_rects() -> Array[Rect2]:
	var rects: Array[Rect2] = []
	var prev_position: float = 0.0
	var x_position := get_x_position()
	for i in range(rect_sizes.size()):
		var rect := Rect2(Vector2(x_position, prev_position), rect_sizes[i])
		prev_position += rect.size.y + packer.margin.y
		rects.append(align_rect(rect))
	return rects
