extends BTNode

var wiz: Node2D

func initialize(blackBoard, root):
	wiz = root.get_node(blackBoard["parent_wizard"])

func tick(blackBoard: Dictionary) -> State:
	var position = blackBoard["target_position"] as Vector2
	
	var navAgent = wiz.get_node("NavigationAgent2D") as NavigationAgent2D
	
	navAgent.target_position = position
	
	if(blackBoard["moves"] > 0):
		wiz.global_position = navAgent.get_next_path_position()
		blackBoard["moves"] -= 1
		return State.SUCCESS
	else:
		return State.FAILURE
