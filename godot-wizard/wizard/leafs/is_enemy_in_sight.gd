extends BTNode

var wiz: Node2D

func initialize(blackBoard, root):
	wiz = root.get_node(blackBoard["parent_wizard"])

func tick(blackBoard: Dictionary) -> State:
	var space_state = wiz.get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(wiz.position, blackBoard["target_position"])
	query.exclude = [wiz]
	query.collision_mask = 0b101 # 101 vue que c'est le layer 1 et 3 et qu'on regarde pas le 2 (= 5 en binaire du coup)
	query.collide_with_areas = true
	var result = space_state.intersect_ray(query)
	
	#print(query.collision_mask)
	
	var state = State.FAILURE
	
	if(!result.is_empty()):
		if(result["collider"].get_parent().is_in_group("wizard")):
			state = State.SUCCESS
	
	return state
