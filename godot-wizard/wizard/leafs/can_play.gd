extends BTNode


func tick(blackBoard: Dictionary) -> State:
	if(blackBoard["can_play"] && $"../../../LifeComponent".lifeAmount > 0):
		return State.SUCCESS
	else:
		return State.FAILURE
