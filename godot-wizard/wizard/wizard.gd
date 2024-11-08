extends Node2D

signal finishedRound()

@onready var btRoot: BTRoot = $BTRoot

func restoreRoundState():
	btRoot.blackBoard["moves"] = 3
	btRoot.blackBoard["has_shot"] = false
	btRoot.blackBoard["can_play"] = true
	
func setTeam(tag: String):
	if(tag=="B"):
		$WizardIdle.play("wizardB")
	else:
		$WizardIdle.play("wizardA")


func _on_round_finished_finished_round() -> void:
	btRoot.blackBoard["can_play"] = false
	finishedRound.emit()


func _on_colection_area_area_entered(area: Area2D) -> void:
	btRoot.blackBoard["projectiles"] += 1
	area.collect()
