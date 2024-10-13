@icon("res://pattern/BehaviorTree/icons/BTSelector.png")

class_name BTSelector

extends BTControl

var currentChildIdx = 0

func tick(blackBoard):
	if(childNodes.size() == 0):
		return State.SUCCESS
	
	var childState = childNodes[currentChildIdx].tick(blackBoard)
	
	if(childState == State.SUCCESS):
		currentChildIdx = 0
		return State.SUCCESS
	elif(childState == State.FAILURE):
		if(currentChildIdx == childNodes.size()-1):
			currentChildIdx = 0
			return State.FAILURE
		else:
			currentChildIdx += 1;
			return State.PROCESS
	else:
		return State.PROCESS
