@tool
extends Node2D

@export var packer1: RectPack2D:
	set(value):
		packer1 = value
		_on_update_packer(packer1)

@export var packer2: RectPack2D:
	set(value):
		packer2 = value
		_on_update_packer(packer2)

@export var packer3: RectPack2D:
	set(value):
		packer3 = value
		_on_update_packer(packer3)

@export var rects: Array[Rect2] = [
	Rect2(0, 0, 50, 20),
	Rect2(120, 10, 40, 70),
	Rect2(10, 30, 70, 50),
	Rect2(180, 30, 30, 25),
	Rect2(60, 100, 50, 50),
	Rect2(120, 120, 90, 90),
	Rect2(60, 10, 50, 30)
]:
	set(value):
		rects = value
		queue_redraw()


func _draw() -> void:
	# Draw reference rectangle
	var start_pos := Vector2(30, 60)
	
	# Draw packers
	draw_set_transform(start_pos)
	draw_unpacked(Color.ORANGE_RED)
	
	draw_set_transform(start_pos + Vector2(280, 0))
	draw_packer(packer1, Color.GOLD)
	
	draw_set_transform(start_pos + Vector2(0, 280))
	draw_packer(packer2, Color.MEDIUM_SEA_GREEN)
	
	draw_set_transform(start_pos + Vector2(280, 280))
	draw_packer(packer3, Color.DODGER_BLUE)


func draw_unpacked(color: Color) -> void:
	for rect in rects:
		draw_rect(rect, color)


func draw_packer(packer: RectPack2D, color: Color) -> void:
	if not packer: return
	var output := packer.pack(rects)
	var new_rects := output.get_rects()
	for rect in new_rects:
		draw_rect(rect, color)


func _on_update_packer(packer: RectPack2D) -> void:
	if not packer.changed.is_connected(queue_redraw):
		packer.changed.connect(queue_redraw)
	queue_redraw()
