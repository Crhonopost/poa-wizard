extends Node2D


var wizard

var wizardsInGame = []
var currentWizardTurn = 0
var gameFinished = false

signal gameStarted
signal gameEnded(winner: String)

func SpawnWiz(spawnPos, team):
	var wiz = wizard.instantiate() as Node2D
	add_child(wiz)
	wiz.position = spawnPos
	wiz.setTeam(team)
	
	var callback = func ():
		gameFinished = true
		gameEnded.emit(team)
		print("dead " + team)
	
	wiz.get_node("LifeComponent").connect("dead",callback)
	wizardsInGame.append(wiz)
	wiz.connect("finishedRound", turnFinished)
	return wiz
	
func _ready() -> void:
	wizard = load("res://wizard/wizard.tscn")
	startGame()

func startGame():
	var spawnPositions = $TerrainGenerator.get_spawn_positions()
	SpawnWiz($TerrainGenerator.position + (Vector2) (spawnPositions[0]) * 64 + Vector2(32,32), "A")
	SpawnWiz($TerrainGenerator.position + (Vector2) (spawnPositions[1]) * 64 + Vector2(32,32), "B")
	
	nextWizardTurn()
	gameStarted.emit()

func turnFinished():
	if(gameFinished): return
	var timer = get_tree().create_timer(1)
	timer.connect("timeout", nextWizardTurn)

func nextWizardTurn():
	var wiz = wizardsInGame[currentWizardTurn]
	wiz.restoreRoundState()
	currentWizardTurn = (currentWizardTurn + 1)%wizardsInGame.size()


func _on_restart_pressed() -> void:
	$TerrainGenerator.regenerate()
	gameFinished = false
	for wizard in wizardsInGame:
		wizard.queue_free()
	wizardsInGame.clear()
	startGame()
