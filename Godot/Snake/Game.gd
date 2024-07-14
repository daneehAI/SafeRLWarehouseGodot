extends Node2D
class_name game

var segment_size = 16
var grid_size = Vector2i(35, 35) # Adjust based on your screen size

@onready var food = $Food
@onready var snake = $Snake
@onready var move_timer = $MoveTimer

var state_size
var state

var Background

func _ready():
	init_state()
	
	init_borders()
	
	reset()

func init_state():
	state = []
	state_size = grid_size.x * grid_size.y
	state.resize(state_size)

func init_borders():
	snake.boundaries = Vector2i(grid_size * segment_size)
	
	Background = $Background
	Background.scale = grid_size
	Background.scale = Background.scale + Vector2.ONE
	Background.position = grid_size * segment_size / 2

func _physics_process(delta):
	snake.move_snake()

func _on_move_timer_timeout():
	#snake.move_snake()
	pass

func reset():
	food.segment_size = segment_size
	food.grid_size = grid_size
	food.randomize_position()
	
	snake.initialize_snake((grid_size/2)*segment_size)
	
	move_timer.start()

func get_state() -> Array:
	for i in state_size:
		state[i] = 0
	
	state[coords_to_index(food.position)] = 1
	
	for segment in snake.snake_segments:
		state[coords_to_index(segment.position)] = 3
	state[coords_to_index(snake.snake_segments[0].position)] = 2
	
	return state

func coords_to_index(coords : Vector2i):
	return coords.y/segment_size * grid_size.x + coords.x/segment_size
