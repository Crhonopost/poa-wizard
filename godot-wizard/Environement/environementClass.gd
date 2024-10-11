extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tableauMurs = get_node("TileMap").tabWall
	var tableauSpells = get_node("TileMap").tabSpell
	#print(tableauSpells)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
