extends Node2D

signal finishedRound()

@onready var btRoot: BTRoot = $BTRoot

func restoreRoundState():
	btRoot.blackBoard["moves"] = 3
	btRoot.blackBoard["has_shot"] = false
	btRoot.blackBoard["can_play"] = true


func _on_round_finished_finished_round() -> void:
	btRoot.blackBoard["can_play"] = false
	finishedRound.emit()
