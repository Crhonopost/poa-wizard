extends Control

@onready var log = $log

func logMessage(content: String):
	var labelMsg = Label.new()
	labelMsg.text = content
	log.add_child(labelMsg)

func _ready() -> void:
	print($"../Environement".getFlowersPosition())
