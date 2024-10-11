extends BTNode

func tick(blackBoard: Dictionary) -> State:
	if (blackBoard["projectiles"] == 0) :
		return State.FAILURE
	return State.SUCCESS
