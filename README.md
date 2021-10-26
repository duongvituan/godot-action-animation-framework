![GDAction](https://github.com/duongvituan/godot-action-animation-framework/blob/master/image/main.png)

# GDAction
This is plugins support make animation in godot, easy to learn, fast to code.

I have used SKSprite and Cocos game engines and I am extremely impressed with the “Action” in these engines.

It's similar to Godot's Tween, but easy to use, simple syntax, I liked it very much.

So I have remake this feature on Godot, you can use it completely for free.

You can use it to code some simple animations, with just a few simple lines of code.

## Update 1.0.2 (26/10/21)
Change logs:

- Fix bug crash when use reverse action

- Add ease function:
ex:
```python
gd.move_to_x(end_x_position, 2.0).with_easing(gd.ease_func.ease_in).start($Sprite2)
```

- Fix bug crash of action repeat when the node was free before the action complete.

- Handle preview demo.


## Installation
This is a regular editor plugin. Copy the contents of addons/godot-action into the same folder in your project, and activate it in your project settings.

If you want to know more about installing plugins you can read the [official documentation page](https://docs.godotengine.org/en/stable/tutorials/plugins/editor/installing_plugins.html).


## Demo Code:
Download source code and run demo

How to create 1 action, use keyword `gd` and call func create, ex: I create 1 action move by x:

```python
# ex: I create 1 action move_by_x 100 pixel with duration = 1.0s
var action = gd.move_by_x(100, 1.0)
```

How to start action on Node:
```python
action.start(node)
```

A group action has multiple child actions. All actions stored in the group begin executing at the same time.

```python
gd.group([
  gd.move_to(target_position, 0.5),
  gd.rotate_by(360, 0.5)
]).start(node)
```

![group](https://github.com/duongvituan/godot-action-animation-framework/blob/master/image/group.gif)


A sequence action has multiple child actions. Each action in the sequence begins after the previous action ends.

```python
gd.sequence([
  gd.move_to(target_position, 0.5),
  gd.rotate_to(360, 0.5)
]).start(node)
```

![sequence](https://github.com/duongvituan/godot-action-animation-framework/blob/master/image/sequence.gif)


You can use different types of time funcs: linear, ease_in, ease_out, ease_in_out, ease_out_in or custom time func with `Curve`.

```python
# linear
gd.move_to_x(end_x_position, 2.0).start($Sprite)

# ease_in
gd.move_to_x(end_x_position, 2.0).with_easing(gd.ease_func.ease_in).start($Sprite2)

# custom time func with curve
gd.move_to_x(end_x_position, 2.0).with_time_func(custom_curve).start($Sprite3)
```

![ease](https://github.com/duongvituan/godot-action-animation-framework/blob/master/image/time_func.gif)


## Action

### Animating
```python
# Animate linear node movement.
func move_to(target_position: Vector2, duration: float) -> GDAction

func move_to_x(x: float, duration: float) -> GDAction

func move_to_y(y: float, duration: float) -> GDAction


func move_by(vector: Vector2, duration: float) -> GDAction

func move_by_x(x: float, duration: float) -> GDAction

func move_by_y(y: float, duration: float) -> GDAction


# Animating the Rotation of a Node
func rotate_by(by_angle: float, duration: float) -> GDAction

func rotate_to(to_angle: float, duration: float) -> GDAction

# Animating the Scaling of a Node
func scale_by(scale: float, duration: float) -> GDAction

func scale_by_vector(vector_scale: Vector2, duration: float) -> GDAction


func scale_to(scale: float, duration: float) -> GDAction

func scale_to_vector(vector_scale: Vector2, duration: float) -> GDAction

# Animating the Transparency of a Node
func fade_alpha_by(alpha_value: float, duration: float) -> GDAction

func fade_alpha_to(alpha_value: float, duration: float) -> GDAction


# Creates an animation change color.
# Func colorize change color only node.
func colorize(color: Color, duration: float) -> GDAction:

# Func colorize_all change color node and child node.
func colorize_all(color: Color, duration: float) -> GDAction
```

### Removing a Node from the Scene
```ptyhon
func remove_node() -> GDAction:
```

### Chaining Actions
Actions can be chained together in multiple ways:

A `sequence` action has multiple child actions. Each action in the sequence begins after the previous action ends.

A `group` action has multiple child actions. All actions stored in the group begin executing at the same time.

A repeating action stores a single child action. When the child action completes, it is restarted.

To delay a subsequent action in the chain, insert a `wait` action in the sequence, and remember that groups, sequences, and repeating actions may be nested.

```python
func group(list_action: Array) -> GDActionGroup

func sequence(list_action: Array) -> GDAction

func repeat(action: GDAction, count: int) -> GDAction

func repeat_forever(action: GDAction) -> GDAction
```


### Delaying Actions
```python
# Creates an action that idles for a randomized period of time.
func wait(time: float, with_range: float = 0.0) -> GDAction
```

### Creating Custom Actions
```python
# Call func from node
func perform(selector: String, on_target: Node) -> GDAction

# Creates an custom action that executes a func over a duration.
func custom_action(selector: String, on_target: Node, duration: float) -> GDAction

# Run and wait action on other node.
func run(action: GDAction, on_target: Node, is_waiting_finished: bool = true) -> GDAction
```


### Controlling Node Visibility
```python
func hide() -> GDAction

func unhide() -> GDAction
```

## Reversing an Animation
This method always returns an action object; however, not all actions are reversible.
When reversed, some actions return an object that either does nothing or that performs the same action as the original action.
```python
func reversed() -> SKAction
```

## Config property action

```python
func with_delay(delay: float) -> GDAction:

func with_speed(speed: float) -> GDAction:

func with_time_func(time_func: Curve) -> GDAction:

func with_easing(ease_func_value: float) -> GDAction:
```

ease func cheat sheet:

![ease_func](https://raw.githubusercontent.com/godotengine/godot-docs/3.3/img/ease_cheatsheet.png)

sample code:

```python
gd.move_by_x(300, 1.0).with_easing(2.0).start(node)

gd.move_by_y(200, 1.0).with_time_func(custom_curve).start(node)
```

## Control action on a node
Pause, resume, cancel and finish action.

```python
# pause
func pause_all_action()

func pause_all_action_on_node(node: Node)

func pause_action_on_node(node: Node, action: GDAction)

# resume
func resume_all_action()

func resume_all_action_on_node(node: Node)

func resume_action_on_node(node: Node, action: GDAction)

# cancel
func cancel_all_action()

func cancel_all_action_on_node(node: Node)

func cancel_action_on_node(node: Node, action: GDAction)

# finish
func finish_all_action()

func finish_all_action_on_node(node: Node)

func finish_action_on_node(node: Node, action: GDAction)
```

sample code:
```python
gd.cancel_all_action_on_node(node)
```

Note that the action will be automatically released when the action is done.
So if you use pause, you have to use resume to make it work again to free up memory,
in case you want to stop the action and not resume, you should use cancel or finish.


## Contribution

Contributions are welcome and are accepted via pull requests.


## License

[MIT License](https://github.com/duongvituan/godot-action-animation-framework/blob/master/LICENSE)

Copyright (c) 2021-present, [Duong Vi Tuan](https://github.com/duongvituan)
