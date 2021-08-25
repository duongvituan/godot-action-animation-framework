class_name GDActionMoveTo extends GDActionInterval

var x # float or null
var y # float or null


func _init(x, y, duration: float).(duration):
	self.x = x
	self.y = y


func _create_action_node(key: String, node):
	var action_node = GDActionNodeMoveTo.new(self, key, node)
	action_node.time_func = time_func
	return action_node


func _run_action(action_node: GDActionNode, node: Node, delay: float, speed: float):
	._run_action(action_node, node, delay, speed)
	action_node.move_to(x, y, duration, delay, speed)

