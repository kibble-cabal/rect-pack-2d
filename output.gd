
class_name RectPack2DOutput

var packer: RectPack2D

func _init(packer_value: RectPack2D) -> void:
	packer = packer_value

func get_rects() -> Array[Rect2]: return []	
func insert(_rect: Rect2) -> void: pass


class Vertical extends RectPack2DOutput:
	var grid: Array[RectPack2DOutputColumn] = []
	
	
	func add_column() -> RectPack2DOutputColumn:
		var column := RectPack2DOutputColumn.new(packer)
		if grid.size() > 0: column.left_neighbor = grid[-1]
		grid.append(column)
		return column
	
	
	func insert(rect: Rect2) -> void:
		if grid.size() == 0: add_column()
		for _i in 2:
			var column := grid[-1]
			if column.insert(rect): break
			add_column()
	
	
	func get_rects() -> Array[Rect2]:
		var rects: Array[Rect2] = []
		for column in grid:
			rects.append_array(column.get_rects())
		return rects


class Horizontal extends RectPack2DOutput:
	var grid: Array[RectPack2DOutputRow] = []
	
	
	func add_row() -> RectPack2DOutputRow:
		var row := RectPack2DOutputRow.new(packer)
		if grid.size() > 0: row.upper_neighbor = grid[-1]
		grid.append(row)
		return row
	
	
	func insert(rect: Rect2) -> void:
		if grid.size() == 0: add_row()
		for _i in 2:
			var row := grid[-1]
			if row.insert(rect): break
			add_row()
	
	
	func get_rects() -> Array[Rect2]:
		var rects: Array[Rect2] = []
		for row in grid:
			rects.append_array(row.get_rects())
		return rects
