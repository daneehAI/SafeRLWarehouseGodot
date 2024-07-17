extends AIController2D

# Stores the action sampled for the agent's policy, running in python
var move_action : int = 0

@onready var my_game : game = get_parent().get_parent()

var obs_dimensions

func get_obs_space():
	print(obs_dimensions)
	return {
		"camera_2d": {"size": obs_dimensions, "space": "box"},
	}

func get_obs() -> Dictionary:
	var obs = my_game.get_state().hex_encode()
	return {"camera_2d":obs}

func get_reward() -> float:
	return reward

func get_action_space() -> Dictionary:
	return {
		"move_action" : {
			"size": 4,
			"action_type": "discrete"
		},
	}

func set_action(action) -> void:
	move_action = action["move_action"]
