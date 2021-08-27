extends Node2D

# we can initiate action once and use it for other nodes
var action_animation_tap: GDAction

func _ready():
	action_animation_tap = gd.sequence([
		gd.scale_to(1.3, 0.2),
		gd.scale_to(0.85, 0.2),
		gd.scale_to(1.1, 0.1),
		gd.scale_to(1.0, 0.1)
	])
	
	$Sprite.connect("click", self, "click_node")
	$Sprite2.connect("click", self, "click_node")
	$Sprite3.connect("click", self, "click_node")

func click_node(node):
	action_animation_tap.start(node)
