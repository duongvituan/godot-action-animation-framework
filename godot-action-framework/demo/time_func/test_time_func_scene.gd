extends Node2D


const custom_curve = preload("res://demo/time_func/custom_curve.tres")
var end_x_position: float


func _ready():
	end_x_position = get_viewport().size.x - 100


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("click"):
		start_move()


func start_move() -> void:
	# linear
	gd.move_to_x(end_x_position, 2.0).start($Sprite)
	
	# ease_in
	gd.move_to_x(end_x_position, 2.0).with_easing(gd.ease_func.ease_in).start($Sprite2)
	
	# ease_out
	gd.move_to_x(end_x_position, 2.0).with_time_func(custom_curve).start($Sprite3)

