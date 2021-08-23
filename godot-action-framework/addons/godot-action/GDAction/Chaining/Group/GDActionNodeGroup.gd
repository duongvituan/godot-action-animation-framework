class_name GDActionNodeGroup extends GDActionNodeInstant

var list_action: Array = []
var count_action_finished = 0


func get_class() -> String:
	return "GDActionNodeGroup"


func _init(action, key, node).(action, key, node):
	pass


func _reset_value():
	._reset_value()
	count_action_finished = 0


func start_group(list_action: Array, delay: float, speed: float):
	self.list_action = list_action
	self.delay = delay
	self.speed = speed
	stop()
	_reset_value()
	_run()


func _start_action():
	_run_group(list_action)


func _on_action_object_completed(action_node):
	action_node.disconnect("finished", self, "_on_action_object_completed")
	
	count_action_finished += 1
	
	if count_action_finished >= self.list_action.size():
		_finished()
		return


func _run_group(list_action: Array):
	if not is_instance_valid(node):
		_finished()
	
	for action in list_action:
		var action_node = action._start_from_action(node, key, speed)
		if not action_node.is_connected("finished", self, "_on_action_object_completed"):
			action_node.connect("finished", self, "_on_action_object_completed")


func stop():
	.stop()
	for action in list_action:
		action._stop_action_with_parem_key(key)

