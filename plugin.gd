@tool
extends EditorPlugin

const Scripts = {
	"RectPack2D": preload("rect_pack_2d.gd"),
	"RectPack2DOutput": preload("output.gd"),
	"RectPack2DOutputGrid": preload("output_grid.gd"),
	"RectPack2DOutputColumn": preload("output_column.gd"),
	"RectPack2DOutputRow": preload("output_row.gd"),
}

const Icons = {
	"RectPack2D": preload("assets/icon.png")
}

func _enter_tree() -> void:
	add_custom_type("RectPack2D", "Resource", Scripts.RectPack2D, Icons.RectPack2D)
	add_custom_type("RectPack2DOutput", "Object", Scripts.RectPack2DOutput, null)
	add_custom_type("RectPack2DOutputGrid", "Object", Scripts.RectPack2DOutputGrid, null)
	add_custom_type("RectPack2DOutputColumn", "Object", Scripts.RectPack2DOutputColumn, null)
	add_custom_type("RectPack2DOutputRow", "Object", Scripts.RectPack2DOutputRow, null)


func _exit_tree() -> void:
	remove_custom_type("RectPack2D")
	remove_custom_type("RectPack2DOutput")
	remove_custom_type("RectPack2DOutputGrid")
	remove_custom_type("RectPack2DOutputColumn")
	remove_custom_type("RectPack2DOutputRow")
