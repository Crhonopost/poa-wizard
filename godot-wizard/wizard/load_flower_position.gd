extends BTNode

var wiz: Node2D
var environement: Node

func initialize(blackBoard, root):
	wiz = root.get_node(blackBoard["parent_wizard"])
	environement = get_tree().get_nodes_in_group("environement")[0]

func tick(blackBoard: Dictionary) -> State:
	var flowers = []
	if(environement):
		flowers = environement.getFlowersPosition()
	
	if(flowers.size() == 0):
		return State.FAILURE
	
	var min = wiz.position.distance_to(flowers[0])
	var flower_min = flowers[0]
	
	for flower in flowers:
		var distance = wiz.position.distance_to(flower)
		if (distance < min) :
			min = distance
			flower_min = flower
	
	blackBoard["flower_position"] = flower_min # trouver la position
	return State.SUCCESS
