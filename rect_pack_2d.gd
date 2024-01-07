@tool
class_name RectPack2D extends Resource

## Packs provided rects into a shape, preserving rect order

enum Expand {
	HORIZONTAL,
	VERTICAL,
	NONE,
}

enum Fill {
	HORIZONTAL,
	VERTICAL,
}

const CENTER := 2
const TOP := 4
const BOTTOM := 8
const LEFT := 16
const RIGHT := 32

@export_flags("Center:2", "Top:4", "Bottom:8", "Left:16", "Right:32") var inner_alignment: int = 0:
	set(value):
		inner_alignment = value
		emit_changed()

@export var expand_type := Expand.NONE:
	set(value):
		expand_type = value
		emit_changed()

@export var fill_type := Fill.HORIZONTAL:
	set(value):
		fill_type = value
		emit_changed()

@export var max_height: float = -1.0:
	set(value):
		max_height = value
		emit_changed()

@export var max_width: float = -1.0:
	set(value):
		max_width = value
		emit_changed()

@export var h_margin: float = 0.0:
	set(value):
		h_margin = value
		emit_changed()

@export var v_margin: float = 0.0:
	set(value):
		v_margin = value
		emit_changed()

var margin: Vector2:
	get: return Vector2(h_margin, v_margin)

var max_size: Vector2:
	get: return Vector2(max_width, max_height)



func pack(rects: Array[Rect2]) -> RectPack2DOutput:
	var output: RectPack2DOutput
	
	match fill_type:
		Fill.HORIZONTAL: output = RectPack2DOutput.Horizontal.new(self)
		Fill.VERTICAL: output = RectPack2DOutput.Vertical.new(self)
	
	for rect in rects:
		output.insert(rect)
		
	return output
