class_name BTDecorator
extends BTNode

var child

func initialize(blackBoard: Dictionary, root: BTNode):
	child = get_child(0)
	child.initialize(blackBoard, root)

func tick(blackBoard: Dictionary) -> State:
	return child.tick(blackBoard)
