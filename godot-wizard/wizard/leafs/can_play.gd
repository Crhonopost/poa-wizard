extends BTNode


func tick(blackBoard: Dictionary) -> State:
	if(blackBoard["can_play"]):
		return State.SUCCESS
	else:
		return State.FAILURE
