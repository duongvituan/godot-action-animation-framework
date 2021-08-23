class_name GDActionRotateBy extends ActionInterval

var byAngle: float


func _init(byAngle: float, duration: float).(duration):
	self.byAngle = byAngle


func _create_action_node(key: String, node):
	var action_node = GDActionNodeRotateBy.new(self, key, node)
	action_node.time_func = time_func
	return action_node


func _run_action(action_node: GDActionNode, node: Node, delay: float, speed: float):
	._run_action(action_node, node, delay, speed)
	action_node.rotate_by(byAngle, duration, delay, speed)
