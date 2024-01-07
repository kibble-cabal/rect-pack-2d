class_name RectPack2DOutputRow extends RectPack2DOutputGrid

var upper_neighbor: RectPack2DOutputRow = null


func get_width() -> float:
	var width: float = 0
	for i in range(rect_sizes.size()):
		if i > 0: width += packer.margin.x
		width += rect_sizes[i].x
	return width


func get_height() -> float:
	var height := 0.0
	for rect_size in rect_sizes:
		height = maxf(height, rect_size.y)
	return height


func can_fit(rect_size: Vector2) -> bool:
	if packer.max_width > 0 and packer.expand_type != RectPack2D.Expand.HORIZONTAL:
		return get_width() + packer.margin.x + rect_size.x < packer.max_width
	return true


func get_y_position() -> float:
	if upper_neighbor:
		return upper_neighbor.get_y_position() + upper_neighbor.get_height() + packer.margin.y
	return 0.0


## Assumes the rect is starting from the top left. Aligns based on [member inner_alignment] (only vertical alignment applies)
func align_rect(rect: Rect2) -> Rect2:
	var start_y := rect.position.y
	if packer.inner_alignment & RectPack2D.CENTER: rect.position.y = start_y + ((get_height() - rect.size.y) / 2)
	if packer.inner_alignment & RectPack2D.BOTTOM: rect.position.y = start_y + (get_height() - rect.size.y)
	return rect


func get_rects() -> Array[Rect2]:
	var rects: Array[Rect2] = []
	var prev_position: float = 0.0
	var y_position := get_y_position()
	for i in range(rect_sizes.size()):
		var rect := Rect2(Vector2(prev_position, y_position), rect_sizes[i])
		prev_position += rect.size.x + packer.margin.x
		rects.append(align_rect(rect))
	return rects
