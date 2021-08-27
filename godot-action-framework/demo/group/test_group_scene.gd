extends Node2D

onready var node := $Sprite


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		move_node_to_click(get_global_mouse_position())


func move_node_to_click(target_position: Vector2) -> void:
	gd.cancel_all_action_on_node(node)
	
	gd.group([
		gd.move_to(target_position, 0.5),
		gd.rotate_by(360, 0.5)
	]).start(node)
