extends Node2D

@onready var demo_loader: DemoLoader = $DemoLoader
@onready var demo_container := $DemoContainer
@onready var name_label := $Panel/MarginContainer/VBoxContainer/Label

var demo_screen: DemoScreen = null : set = _set_demo_screen

func _ready():
	self.demo_screen = demo_loader.get_first_screen().instantiate() as DemoScreen


func _input(event):
	if event.is_action_pressed("next_demo"):
		on_next()
	elif event.is_action_pressed("previous_demo"):
		on_previous()
	elif event.is_action_pressed("reset_demo"):
		on_reset()

func _set_demo_screen(ds: DemoScreen):
	demo_container.demo_screen = ds
	_update_control_node(ds)
	

func on_reset():
	self.demo_screen = demo_loader.get_current_screen().instantiate()


func on_next():
	self.demo_screen = demo_loader.next().instantiate()


func on_previous():
	self.demo_screen = demo_loader.back().instantiate()


func _update_control_node(ds: DemoScreen):
	name_label.text = "Name: " + ds.get_sceen_name()
