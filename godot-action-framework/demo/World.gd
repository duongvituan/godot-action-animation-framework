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


func create_action():
	# for test
	var move_left = gd.move_by(Vector2(100, 0), 1)
	var move_down = gd.move_by(Vector2(0, 100), 1)
	var action_rotate = gd.rotate_to(720, 1)
	var wait = gd.wait(1.0, 0.5)
	var action_group = gd.group([
		gd.move_by_x(300, 1),
		gd.move_by(Vector2(0, 200), 1)
	])
	var action_sequence = gd.sequence([move_left, action_rotate, wait, move_down, action_group])
	return action_sequence

# test
func move_ship_to_click(target_position: Vector2) -> void:
	gd.cancel_all_action_on_node(sprite)
	create_action().start(sprite)
#	action.start(sprite)
