extends Node2D

var segment_size
var grid_size

func randomize_position():
	var random_x = randi() % grid_size.x * segment_size
	var random_y = randi() % grid_size.y * segment_size
	position = Vector2i(random_x, random_y)
