class_name BTNode

extends Node

enum State {
	SUCCESS,
	FAILURE,
	PROCESS
}

func tick(blackBoard: Dictionary) -> State:
	return State.FAILURE
