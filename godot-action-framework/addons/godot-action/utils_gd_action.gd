extends Node

onready var time_func: GDTimeFunc = $time_func
onready var _cache = $cache

# Animating a Node's Position in a Linear Path
# Animate linear node movement.
func move_to(target_position: Vector2, duration: float) -> GDAction:
	return GDActionMoveTo.new(target_position.x, target_position.y, duration)


func move_to_x(x: float, duration: float) -> GDAction:
	return GDActionMoveTo.new(x, null, duration)


func move_to_y(y: float, duration: float) -> GDAction:
	return GDActionMoveTo.new(null, y, duration)


func move_by(vector: Vector2, duration: float) -> GDAction:
	return GDActionMoveBy.new(vector, duration)


func move_by_x(x: float, duration: float) -> GDAction:
	return GDActionMoveBy.new(Vector2(x, 0), duration)


func move_by_y(y: float, duration: float) -> GDAction:
	return GDActionMoveBy.new(Vector2(0, y), duration)


# Animating the Rotation of a Node
func rotate_by(by_angle: float, duration: float) -> GDAction:
	return GDActionRotateBy.new(by_angle, duration)


func rotate_to(to_angle: float, duration: float) -> GDAction:
	return GDActionRotateTo.new(to_angle, duration)


# Animating the Scaling of a Node
# Animate the visual scaling of a node.
func scale_by(vector_scale: Vector2, duration: float) -> GDAction:
	return GDActionScaleBy.new(vector_scale, duration)


func scale_to(vector_scale: Vector2, duration: float) -> GDAction:
	return GDActionScaleTo.new(vector_scale, duration)


# Animating the Transparency of a Node
# Gradually change a node's transparency.
func fade_alpha_by(alpha_value: float, duration: float) -> GDAction:
	return GDActionFadeAlphaBy.new(alpha_value, duration)


func fade_alpha_to(alpha_value: float, duration: float) -> GDAction:
	return GDActionFadeAlphaTo.new(alpha_value, duration)


# Removing a Node from the Scene
func remove_node() -> GDAction:
	return GDActionRemove.new()

# Chaining Actions
# Create an action that contains a series, or chain, of other actions.

# A group action has multiple child actions.
# All actions stored in the group begin executing at the same time.
func group(list_action: Array) -> GDActionGroup:
	return GDActionGroup.new(list_action)

# A sequence action has multiple child actions.
# Each action in the sequence begins after the previous action ends.
func sequence(list_action: Array) -> GDAction:
	return GDActionSequence.new(list_action)

# A repeating action stores a single child action.
# When the child action completes, it is restarted.
func repeat(action: GDAction, count: int) -> GDAction:
	return GDActionRepeat.new(action, count)


func repeat_forever(action: GDAction) -> GDAction:
	return GDActionRepeatForever.new(action)


# Delaying Actions
# Creates an action that idles for a randomized period of time.
func wait(time: float, with_range: float = 0.0) -> GDAction:
	return GDActionWait.new(time, with_range)


# Creating Custom Actions
func perform(selector: String, on_target: Node) -> GDAction:
	return GDActionPerform.new(selector, on_target)


func custom_action(selector: String, on_target: Node, duration: float) -> GDAction:
	return GDActionCustomAction.new(selector, on_target, duration)



# Manager Action

func pause_all_action_on_node(node: Node):
	_cache.pause_all_action_on_node(node)

func pause_action_on_node(node: Node, action_node: GDAction):
	_cache.pause_action_on_node(node, action_node)

func resume_all_action_on_node(node: Node):
	_cache.resume_all_action_on_node(node)

func resume_action_on_node(node: Node, action_node: GDAction):
	_cache.resume_action_on_node(node, action_node)

func cancel_all_action_on_node(node: Node):
	_cache.cancel_all_action_on_node(node)

func cancel_action_on_node(node: Node, action_node: GDAction):
	_cache.cancel_action_on_node(node, action_node)

func finish_all_action_on_node(node: Node):
	_cache.finish_all_action_on_node(node)

func finish_action_on_node(node: Node, action_node: GDAction):
	_cache.finish_action_on_node(node, action_node)
