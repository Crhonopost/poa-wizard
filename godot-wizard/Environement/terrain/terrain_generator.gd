extends Node2D


@onready var wallMap: TileMapLayer = $Walls
@onready var groundMap: TileMapLayer = $Ground

@export var wallTileCoord: Vector2i = Vector2i(16,6)
@export var groundTileCoord: Vector2i

@export var map_width = 17
@export var map_height = 9

#id de la tuile a rajouter
var tile_id =  1

#nombre tuiles aleatoires
var tile_count = 20
var spell_count = 4

var tabWall = []
var tabSpell = []

func place_spell():
	var placed_spell = 0
	while placed_spell < spell_count :
		var x = randi_range(3, map_width-4)
		var y = randi_range(2, map_height-2)
		var position = Vector2i(x, y)
		
		if wallMap.get_cell_atlas_coords(position) != wallTileCoord:
			tabSpell.append(position)
			wallMap.set_cell(position, 0 ,Vector2i(9, 5))
			placed_spell += 1
			tabSpell.append(position)

func place_random_tiles():
	var placed_tiles = 0
	while placed_tiles < tile_count:
		var x = randi_range(2, map_width-2)
		var y = randi_range(0, map_height)
		var position = Vector2i(x, y)


		# Vérifie si une tuile est déjà placée à cette position dans le layer foreground
		if wallMap.get_cell_atlas_coords(position) != wallTileCoord:
			tabWall.append(position)
			# Place la tuile à la position générée
			wallMap.set_cell(position, 0, wallTileCoord)
			placed_tiles += 1

func get_spawn_positions():
	return $Spawns.get_used_cells()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print(get_cell_atlas_coords(0,Vector2i(0, 0)))
	place_random_tiles()
	place_spell()
