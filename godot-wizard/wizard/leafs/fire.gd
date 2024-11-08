extends BTNode

var projectile: PackedScene = load("res://wizard/projectile.tscn")
var wizard: Node2D

func initialize(blackBoard, root):
	wizard = root.get_node(blackBoard["parent_wizard"])

func tick(blackBoard: Dictionary) -> State:
	var projectileInstance: Projectile = projectile.instantiate()
	projectileInstance.direction = (blackBoard["target_position"] - wizard.position).normalized()
	projectileInstance.spawnPosition = projectileInstance.direction * 50 + wizard.global_position
	
	get_tree().get_nodes_in_group("fixed_space")[0].add_child(projectileInstance)
	
	blackBoard["projectiles"] -= 1
	blackBoard["has_shot"] = true
	
	return State.SUCCESS
