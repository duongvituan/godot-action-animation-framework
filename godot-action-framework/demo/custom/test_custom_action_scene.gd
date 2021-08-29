extends Node2D

onready var info_label := $CanvasLayer/Label
onready var current_time_label := $CanvasLayer/Label2
onready var progress_bar := $CanvasLayer/ProgressBar
onready var info_progress_bar_label := $CanvasLayer/ProgressBar/Label

var action: GDAction
var is_running_action = false


func _ready():
	var time_action = 2.0
	progress_bar.max_value = time_action
	action = gd.custom_action("_custom_update", self, time_action)
	action.connect("action_finished", self, "action_done")

# You custom animation in this func:
func _custom_update(value: float, eased_value: float, delta: float):
	progress_bar.value = value
	info_progress_bar_label.text = str(int(eased_value * 100)) + "%"
	current_time_label.text = "Current time: " + str(value) + " s"


func _unhandled_input(event: InputEvent) -> void:
	if is_running_action:
		return
	if event.is_action_pressed("click"):
		info_label.text = "Running custom action"
		action.start(self)
		is_running_action = true


func action_done():
	info_label.text = "custom action finish"
	is_running_action = false
