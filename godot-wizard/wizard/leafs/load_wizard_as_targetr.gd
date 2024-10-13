extends BTNode

var wiz: Node2D

func initialize(blackBoard, root):
	wiz = root.get_node(blackBoard["parent_wizard"])

func tick(blackBoard: Dictionary) -> State:
	var wizards = get_tree().get_nodes_in_group("wizard")
	var filtered_wizards = []

	for wizard in wizards:
		if wizard != wiz:
			filtered_wizards.append(wizard)
	
	if(filtered_wizards.size() > 0):
		blackBoard["target_position"] = filtered_wizards[0].position # trouver la position
	return State.SUCCESS
