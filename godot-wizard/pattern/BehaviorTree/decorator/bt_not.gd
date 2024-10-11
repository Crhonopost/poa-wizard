extends BTNode

var child: BTNode

@export var count = 1

func tick(blackboard):
	
	var childState = child.tick(blackboard)
	if(childState == State.SUCCESS):
		return State.FAILURE
	elif(childState == State.FAILURE):
		return State.SUCCESS
	else:
		return State.PROCESS
