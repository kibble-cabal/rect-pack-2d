class_name RectPack2DOutputGrid

var packer: RectPack2D

var rect_sizes: Array[Vector2] = []


func _init(packer_value: RectPack2D) -> void:
	packer = packer_value


func insert(rect: Rect2) -> bool:
	if can_fit(rect.size):
		rect_sizes.append(rect.size)
		return true
	return false


func get_size() -> Vector2:
	return Vector2(get_width(), get_height())


func get_width() -> float: return 0.0
func get_height() -> float: return 0.0
func can_fit(_rect_size: Vector2) -> bool: return true
func get_x_position() -> float: return 0.0
func get_y_position() -> float: return 0.0
func align_rect(rect: Rect2) -> Rect2: return rect
func get_rects() -> Array[Rect2]: return []
