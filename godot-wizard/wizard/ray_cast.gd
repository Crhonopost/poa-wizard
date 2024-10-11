extends BTNode

@export var wiz: Node2D

func tick(blackBoard: Dictionary) -> State:
	var space_state = get_tree().get_root().get_world_2d().direct_space_state
	var query = PhysicsRayQueryParameters2D.create(wiz.global_position, blackBoard["position_enemy"])
	query.exclude = [wiz]
	query.collision_mask = (1 << 0) | (1 << 2)
	var result = space_state.intersect_ray(query)
	if result["collider"].layer == (1 << 0) :
		print("echec")
		return State.FAILURE
	else :
		print("succés")
	return State.SUCCESS
