class_name GDActionMoveTo extends GDActionInterval

var target_position: Vector2


func _init(target_position: Vector2, duration: float).(duration):
	self.target_position = target_position


func _create_action_node(key: String, node):
	var action_node = GDActionNodeMoveTo.new(self, key, node)
	action_node.time_func = time_func
	return action_node


func _run_action(action_node: GDActionNode, node: Node, delay: float, speed: float):
	._run_action(action_node, node, delay, speed)
	action_node.move_to(target_position, duration, delay, speed)
