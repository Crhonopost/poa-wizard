extends Control

@onready var log = $log

func logMessage(content: String):
	var labelMsg = Label.new()
	labelMsg.text = content
	log.add_child(labelMsg)

func setLoser(wizardType):
	if(wizardType == "B"):
		$FinishedGame/HBoxContainer/WinnerText.text = "Wizard A won !"
		$FinishedGame/HBoxContainer/CenterContainer/WizardIdle.play("wizardA")
	else:
		$FinishedGame/HBoxContainer/WinnerText.text = "Wizard B won !"
		$FinishedGame/HBoxContainer/CenterContainer/WizardIdle.play("wizardB")

func gameFinished(loser):
	setLoser(loser)
	visible = true

func gameStarted():
	visible = false


func _on_start_pressed() -> void:
	$FinishedGame.visible = true
	$Start.visible = false
