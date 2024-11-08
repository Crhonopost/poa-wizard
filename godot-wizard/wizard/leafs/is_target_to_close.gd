extends BTNode

var wizard: Node2D
@export var distance: float = 120

func initialize(blackBoard, root):
	wizard = root.get_node(blackBoard["parent_wizard"])
	print(wizard)

func tick(blackBoard: Dictionary) -> State:
	if(wizard.global_position.distance_to(blackBoard["target_position"]) < distance):
		return State.SUCCESS
	else:
		return State.FAILURE
