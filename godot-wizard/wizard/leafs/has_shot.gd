extends BTNode

func tick(blackBoard: Dictionary) -> State:
	if(blackBoard["has_shot"]):
		return State.SUCCESS
	else:
		return State.FAILURE
