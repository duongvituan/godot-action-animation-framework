class_name GDActionScaleTo extends GDActionInterval

var vector_scale: Vector2


func _init(vector_scale: Vector2, duration: float).(duration):
	self.vector_scale = vector_scale


func _create_action_node(key: String, node):
	var action_node = GDActionNodeScaleTo.new(self, key, node)
	action_node.time_func = time_func
	return action_node


func _run_action(action_node: GDActionNode, node: Node, delay: float, speed: float):
	._run_action(action_node, node, delay, speed)
	action_node.scale_to(vector_scale, duration, delay, speed)

