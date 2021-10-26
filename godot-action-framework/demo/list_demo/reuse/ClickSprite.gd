extends Sprite

signal click(node)

func _input(event):
	if event is InputEventMouse and event.is_pressed() and event.button_index == BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			emit_signal("click", self)
