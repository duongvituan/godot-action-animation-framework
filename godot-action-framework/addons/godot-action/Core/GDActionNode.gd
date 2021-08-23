class_name GDActionNode extends Node

enum NodeType {
	UNKNOW,
	NODE_2D,
	CONTROL
}

signal finished(action_node)

var delay = 0.0
var current_time = 0.0
var speed = 1.0
var time_func = null

var key = ""
var action = null

var is_done: bool = false
var is_remove_when_done: bool = false

var node: Node
var node_type = NodeType.UNKNOW


func _init(action, key: String, node: Node):
	self.action = action
	self.key = key
	self.node = node
	
	if node is Control:
		node_type = NodeType.CONTROL
	elif node is Node2D:
		node_type = NodeType.NODE_2D
	
	connect("finished", action, "_on_action_node_completed")


func _ready():
	set_process(false)


func _finished():
	is_done = true
	set_process(false)
	emit_signal("finished", self)


func _run():
	is_done = false
	set_process(true)


func stop():
	set_process(false)


func _reset_value():
	self.current_time = 0.0

# Support debug
func get_class() -> String:
	return "GDActionNode"

