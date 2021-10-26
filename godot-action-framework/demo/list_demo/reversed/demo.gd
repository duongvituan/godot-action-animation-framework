extends DemoScreen

onready var node := $Sprite
onready var label = $CanvasLayer/Label


var action: GDAction
var action_reversed: GDAction

# test
var is_reversed = false
var is_running_action = false

func _ready():
	action = gd.sequence([
		gd.move_by_x(300, 1.0),
		gd.group([
			gd.move_by_y(300, 1.0),
			gd.rotate_by(360, 1.0)
		])
	])
	
	# A new action that reverses an action’s behavior.
	action_reversed = action.reversed()
	
	action.connect("action_finished", self, "action_done")
	action_reversed.connect("action_finished", self, "action_done")


func _unhandled_input(event: InputEvent) -> void:
	if is_running_action:
		return
	if event.is_action_pressed("click"):
		if is_reversed:
			label.text = "Running action reversed"
			action_reversed.start(node)
		else:
			label.text = "Running action"
			action.start(node)
		is_running_action = true
		is_reversed = not is_reversed


func action_done():
	if is_reversed:
		label.text = "Click to run action reversed"
	else:
		label.text = "Click to run action"
	is_running_action = false


func get_name() -> String:
	return "Reverse"
