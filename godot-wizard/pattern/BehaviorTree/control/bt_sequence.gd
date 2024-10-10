class_name BTSequence

extends BTControl

var currentChildIdx = 0

func tick(blackBoard):
	var childState = childNodes[currentChildIdx].tick(blackBoard)
	
	if(childState == State.FAILURE):
		currentChildIdx = 0
		return State.FAILURE
	elif(childState == State.SUCCESS):
		if(currentChildIdx == childNodes.size()-1):
			currentChildIdx = 0
			return State.SUCCESS
		else:
			currentChildIdx += 1;
			return State.PROCESS
	else:
		return State.PROCESS
