@icon("res://pattern/BehaviorTree/icons/BT.png")

class_name BTRoot

extends BTNode

var child: BTNode

@export var blackBoard: Dictionary

func _ready() -> void:
	child = get_child(0)
	child.initialize(blackBoard, self)

func _physics_process(delta: float) -> void:
	child.tick(blackBoard)
