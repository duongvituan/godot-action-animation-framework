extends Node

const linear = preload("res://addons/godot-action/TimeFunc/Linear.tres")
const ease_in = preload("res://addons/godot-action/TimeFunc/EaseIn.tres")
const ease_out = preload("res://addons/godot-action/TimeFunc/EaseOut.tres")
const ease_in_out = preload("res://addons/godot-action/TimeFunc/EaseInOut.tres")
const ease_out_in = preload("res://addons/godot-action/TimeFunc/EaseOutIn.tres")


# Animating a Node's Position in a Linear Path
# Animate linear node movement.
func move_to(target_position: Vector2, duration: float) -> GDAction:
	return GDActionMoveTo.new(target_position, duration)


func move_by(vector: Vector2, duration: float) -> GDAction:
	return GDActionMoveBy.new(vector, duration)


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


# Creating Custom Actions
func perform(selector: String, on_target: Node) -> GDAction:
	return GDActionPerform.new(selector, on_target)


func custom_action(selector: String, on_target: Node, duration: float) -> GDAction:
	return GDActionCustomAction.new(selector, on_target, duration)

