extends Node2D


@onready var SpawnA = $SpawnA
@onready var SpawnB = $SpawnB
var wizard

func onWizardDeath():
	#get_tree().paused = true
	$Label.text = "un Wizard a été vaincu"  # Définir le texte du message
	$Label.visible = true  # Rendre le label visible pour afficher le message
	get_tree().paused = true  # Met en pause la scène
	await get_tree().create_timer(2.0).timeout  # Attendre 2 secondes
	get_tree().paused = false  # Reprendre la scène après 2 secondes
	$Label.visible = false

func SwpanWiz(spawnPos):
	var wiz = wizard.instantiate()
	add_child(wiz)
	wiz.position = spawnPos
	wiz.get_node("LifeComponent").connect("dead",onWizardDeath)
	return wiz
	
func _ready() -> void:
	wizard = load("res://wizard/wizard.tscn")
	var wizA = SwpanWiz(SpawnA.position)
	var wizB = SwpanWiz(SpawnB.position)
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
