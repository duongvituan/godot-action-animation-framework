extends Node2D

onready var sprite := $Sprite
onready var sprite2 := $Sprite2
onready var sprite3 := $Sprite3
onready var texture_rect := $TextureRect

const Custom_curve = preload("res://demo/custom_curve.tres")

#var action: GDAction

#func _ready():
#	action = create_action()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		move_ship_to_click(get_global_mouse_position())


func create_action_test():
	# for test
	var move_left = gd.move_by(Vector2(100, 0), 1)
	var move_down = gd.move_by(Vector2(0, 100), 1).with_time_func(gd.time_func.ease_out)
	var rotate = gd.rotate_by(720, 1)
	var wait = gd.wait(1.0, 0.5)
	var group = gd.group([
		gd.move_by_x(300, 1).with_time_func(Custom_curve),
		gd.move_by(Vector2(0, 200), 1)
	])
	var sequence = gd.sequence([move_left, rotate, wait, move_down, group])
	return sequence

# test
func move_ship_to_click(target_position: Vector2) -> void:
	gd.cancel_all_action_on_node(sprite)
	create_action_test().start(sprite)
#	action.start(sprite)
