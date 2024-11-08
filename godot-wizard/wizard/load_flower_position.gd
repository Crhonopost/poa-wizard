extends BTNode

var wiz: Node2D

func initialize(blackBoard, root):
	wiz = root.get_node(blackBoard["parent_wizard"])

func tick(blackBoard: Dictionary) -> State:
	var vec = Vector2(700,500)
	var flowers = [vec]
	
	var min = wiz.position.distance_to(flowers[0])
	var flower_min = flowers[0]
	
	for flower in flowers:
		var distance = wiz.position.distance_to(flower)
		if (distance < min) :
			min = distance
			flower_min = flower
	
	blackBoard["flower_position"] = flower_min # trouver la position
	return State.SUCCESS
