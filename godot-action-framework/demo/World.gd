extends Node2D

onready var sprite := $Sprite
onready var sprite2 := $Sprite2
onready var sprite3 := $Sprite3
onready var texture_rect := $TextureRect

const Custom_curve = preload("res://demo/custom_curve.tres")

var action: GDAction


func _ready():
	action = create_action()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		move_ship_to_click(get_global_mouse_position())


func create_action():
	# for test
	var move_left = gd.move_by(Vector2(100, 0), 1)
	var move_down = gd.move_by(Vector2(0, 100), 1)
	var action_rotate = gd.rotate_by(360, 1)
	var action_sequence = gd.sequence([move_left, action_rotate, move_down])
	return action_sequence


func move_ship_to_click(target_position: Vector2) -> void:
	action.start(sprite)

