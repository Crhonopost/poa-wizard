extends BTNode

var projectile: PackedScene = load("res://wizard/projectile.tscn")
var wizard: Node2D

func initialize(blackBoard, root):
	wizard = root.get_node(blackBoard["parent_wizard"])

func tick(blackBoard: Dictionary) -> State:
	var projectileInstance = projectile.instantiate()
	projectileInstance.direction = (blackBoard["target_position"] - wizard.position).normalized()
	
	wizard.add_child(projectileInstance)
	
	blackBoard["projectiles"] -= 1
	
	return State.SUCCESS
