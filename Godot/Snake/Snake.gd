extends Node2D

var snake_segments = []
var direction = Vector2.RIGHT
var segment_size = 16

var segment_prefab = preload("res://segment.tscn")

@onready var ai_controller = $AIController2D

var boundaries : Vector2i

func initialize_snake(start_position : Vector2i):
	direction = Vector2.RIGHT
	
	ai_controller.init(self)
	
	for segment in snake_segments:
		segment.queue_free()
	
	snake_segments.clear()
	
	for i in range(5):
		var segment = create_segment(Vector2(start_position.x-i * segment_size, start_position.y))
		snake_segments.append(segment)

func create_segment(position):
	var segment = segment_prefab.instantiate()
	segment.position = position
	add_child(segment)
	return segment

func _process(delta):
	if ai_controller.heuristic == "human":
		if Input.is_action_pressed("ui_up"):
			direction = Vector2.UP
		elif Input.is_action_pressed("ui_down"):
			direction = Vector2.DOWN
		elif Input.is_action_pressed("ui_left"):
			direction = Vector2.LEFT
		elif Input.is_action_pressed("ui_right"):
			direction = Vector2.RIGHT

func move_snake():
	if ai_controller.heuristic != "human":
		var move = ai_controller.move_action
		if move == 0:
			direction = Vector2.UP
		elif move == 1:
			direction = Vector2.DOWN
		elif move == 2:
			direction = Vector2.LEFT
		elif move == 3:
			direction = Vector2.RIGHT
	
	var new_position = snake_segments[0].position + direction * segment_size
	var new_segment = create_segment(new_position)
	snake_segments.insert(0, new_segment)
	
	if check_collision():
		game_over()
		return
	
	if new_position == get_parent().get_node("Food").position:
		get_parent().get_node("Food").randomize_position()
		ai_controller.reward += 1.0
	else:
		var last_segment = snake_segments.pop_back()
		last_segment.queue_free()

func check_collision():
	var head_position = snake_segments[0].position
	
	if head_position.x < 0 or head_position.x > boundaries.x:
		return true
	if head_position.y < 0 or head_position.y > boundaries.y:
		return true
	
	for i in range(1, snake_segments.size()):
		if head_position == snake_segments[i].position:
			return true
	return false

func game_over():
	ai_controller.done = true
	ai_controller.needs_reset = true
	get_parent().reset()
