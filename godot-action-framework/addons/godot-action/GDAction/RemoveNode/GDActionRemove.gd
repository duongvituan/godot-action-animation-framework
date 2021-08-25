class_name GDActionRemove extends GDActionInstant


func _init().():
	pass


func _create_action_node(key: String, node):
	return GDActionNodeRemove.new(self, key, node)
	

func _run_action(action_node: GDActionNode, node: Node, delay: float, speed: float):
	._run_action(action_node, node, delay, speed)
	action_node.remove_node(delay, speed)
