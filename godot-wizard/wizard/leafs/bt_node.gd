extends BTNode

signal FinishedRound

func tick(blackBoard: Dictionary) -> State:
	FinishedRound.emit()
	return State.SUCCESS
