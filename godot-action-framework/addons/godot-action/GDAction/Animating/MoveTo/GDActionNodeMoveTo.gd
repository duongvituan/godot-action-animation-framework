class_name GDActionNodeMoveTo extends GDActionNodeInterval

var begin_position: Vector2 = Vector2.ZERO
var end_postion: Vector2 = Vector2.ZERO

func get_class() -> String:
	return "GDActionNodeMoveTo"

func _init(action, key, node).(action, key, node):
	pass


func _update(value: float, eased_value: float, delta: float):
	match node_type:
		NodeType.NODE_2D:
			node.position = lerp(begin_position, end_postion, eased_value)
		
		NodeType.CONTROL:
			node.rect_position = lerp(begin_position, end_postion, eased_value)


func move_to(target_postion: Vector2, duration: float, delay = 0.0, speed = 1.0):
	self.end_postion = target_postion
	self.duration = duration
	self.delay = delay
	self.speed = speed
	
	match node_type:
		NodeType.NODE_2D:
			self.begin_position = node.position
		NodeType.CONTROL:
			self.begin_position = node.rect_position
	
	_reset_value()
	_run()

