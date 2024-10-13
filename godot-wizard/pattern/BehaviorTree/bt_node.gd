@icon("res://pattern/BehaviorTree/icons/BTLeaf.png")

class_name BTNode

extends Node

enum State {
	SUCCESS,
	FAILURE,
	PROCESS
}

func initialize(blackBoard: Dictionary, root: BTNode):{}

func tick(blackBoard: Dictionary) -> State:
	return State.FAILURE
