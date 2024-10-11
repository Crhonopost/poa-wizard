extends BTNode

@export var wiz: Node2D

func tick(blackBoard: Dictionary) -> State:
	var wizards = get_tree().get_nodes_in_group("wizard")
	var filtered_wizards = []

	for wizard in wizards:
		if wizard != wiz:
			filtered_wizards.append(wizard)
	
	blackBoard["position_enemy"] = filtered_wizards[0].position # trouver la position
	return State.SUCCESS
