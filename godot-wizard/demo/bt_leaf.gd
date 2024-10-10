extends BTNode


func tick(blackboard):
	if($"../../..".get_global_mouse_position().distance_to($"../../../Area2D".global_position) < 20):
		blackboard["isIn"] = $"../../..".get_local_mouse_position()
	return State.SUCCESS
