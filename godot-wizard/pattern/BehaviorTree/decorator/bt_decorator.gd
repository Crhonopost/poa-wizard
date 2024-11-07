class_name BTDecorator
extends BTNode

var child

func initialize(blackBoard: Dictionary, root: BTNode):
	child = get_child(0)

func tick(blackBoard: Dictionary) -> State:
	return child.tick(blackBoard)
