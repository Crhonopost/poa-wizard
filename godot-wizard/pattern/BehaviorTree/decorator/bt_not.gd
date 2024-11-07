class_name BTNot
extends BTDecorator

func tick(blackBoard: Dictionary) -> State:
	var childState = child.tick(blackBoard)
	
	if(childState == State.SUCCESS):
		return State.FAILURE
	elif(childState == State.FAILURE):
		return State.SUCCESS
	else:
		return State.PROCESS
