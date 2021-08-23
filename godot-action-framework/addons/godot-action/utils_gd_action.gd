extends Node

const linear = preload("res://addons/godot-action/TimeFunc/Linear.tres")
const ease_in = preload("res://addons/godot-action/TimeFunc/EaseIn.tres")
const ease_out = preload("res://addons/godot-action/TimeFunc/EaseOut.tres")
const ease_in_out = preload("res://addons/godot-action/TimeFunc/EaseInOut.tres")
const ease_out_in = preload("res://addons/godot-action/TimeFunc/EaseOutIn.tres")


func move_to(target_position: Vector2, duration: float) -> GDAction:
	return  GDActionMoveTo.new(target_position, duration)


func move_by(vector: Vector2, duration: float) -> GDAction:
	return GDActionMoveBy.new(vector, duration)


func rotate_by(byAngle: float, duration: float) -> GDAction:
	return GDActionRotateBy.new(byAngle, duration)


func group(list_action: Array) -> GDActionGroup:
	return GDActionGroup.new(list_action)


func sequence(list_action: Array) -> GDAction:
	return GDActionSequence.new(list_action)


func repeat(action: GDAction, count: int) -> GDAction:
	return GDActionRepeat.new(action, count)


func repeat_forever(action: GDAction) -> GDAction:
	return GDActionRepeatForever.new(action)


func perform(selector: String, on_target: Node) -> GDAction:
	return GDActionPerform.new(selector, on_target)

