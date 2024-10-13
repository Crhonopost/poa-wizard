class_name BTControl

extends BTNode

var childNodes = []

func _ready() -> void:
	childNodes = get_children()

func initialize(blackBoard, root):
	for child in childNodes:
		child.initialize(blackBoard, root)
