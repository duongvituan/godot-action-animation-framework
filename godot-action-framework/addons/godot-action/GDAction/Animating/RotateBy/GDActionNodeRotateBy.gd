class_name GDActionNodeRotateBy extends GDActionNodeInterval

var angular_velocity = 0.0


func get_class() -> String:
	return "GDActionNodeRotateBy"


func _init(action, key, node).(action, key, node):
	pass


func _update(value: float, eased_value: float, delta: float):
	match node_type:
		NodeType.NODE_2D:
			node.rotation_degrees += self.angular_velocity * delta
		
		NodeType.CONTROL:
			node.rect_rotation += self.angular_velocity * delta


func rotate_by(angle: float, duration: float, delay: float, speed: float):
	if duration <= 0.0:
		finished()
	
	self.angular_velocity = angle / duration
	self.duration = duration
	self.delay = delay
	self.speed = speed
	
	_reset_value()
	_run()

