class_name GDActionRepeatForever extends GDActionInstant

var action: GDAction


func _init(action: GDAction).():
	self.action = action


func _create_action_node(key: String, node):
	return GDActionNodeRepeatForever.new(self, key, node)


func _update_key_if_need(key: String) -> String:
	return _create_key_by_parent_key(key)


func _run_action(action_node: GDActionNode, node: Node, delay: float, speed: float):
	._run_action(action_node, node, delay, speed)
	action_node.start_repeat(action, delay, speed)


func _prepare_remove_action_node_from_key(key: String):
	action._remove_action_node_from_parent_key(key)


func _prepare_stop_action_with_key(key):
	action._stop_action_with_parem_key(key)


func reversed() -> GDAction:
	return get_script().new(action.reversed())
