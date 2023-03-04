extends Node2D

var demo_screen: DemoScreen : set = _set_demo_screen , get =_get_demo_screen


func _remove_old_screen():
	for child in get_children():
		remove_child(child)
		child.queue_free()


func _set_demo_screen(ds: DemoScreen):
	_remove_old_screen()
	add_child(ds)


func _get_demo_screen() -> DemoScreen:
	for node in get_children():
		if node is DemoScreen:
			return node
	return null

