extends Node2D


var wizard

var wizardsInGame = []
var currentWizardTurn = 0
var gameFinished = false

func onWizardDeath():
	gameFinished = false
	$UI.logMessage("un Wizard a été vaincu")

func SwpanWiz(spawnPos):
	var wiz = wizard.instantiate() as Node2D
	add_child(wiz)
	wiz.position = spawnPos
	wiz.get_node("LifeComponent").connect("dead",onWizardDeath)
	wizardsInGame.append(wiz)
	wiz.connect("finishedRound", turnFinished)
	
func _ready() -> void:
	wizard = load("res://wizard/wizard.tscn")
	var spawnPositions = $TerrainGenerator.get_spawn_positions()
	SwpanWiz($TerrainGenerator.position + (Vector2) (spawnPositions[0]) * 64 + Vector2(32,32))
	SwpanWiz($TerrainGenerator.position + (Vector2) (spawnPositions[1]) * 64 + Vector2(32,32))
	
	nextWizardTurn()
	

func turnFinished():
	if(gameFinished): return
	var timer = get_tree().create_timer(5)
	timer.connect("timeout", nextWizardTurn)

func nextWizardTurn():
	var wiz = wizardsInGame[currentWizardTurn]
	wiz.restoreRoundState()
	currentWizardTurn = (currentWizardTurn + 1)%wizardsInGame.size()
