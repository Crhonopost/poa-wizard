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

var placedSpells = []

@onready var flowerPackedScene = load("res://Environement/flower.tscn")

func check_flowers():
	var i = 0
	while i<placedSpells.size():
		var ref = weakref(placedSpells[i])
		if(ref.get_ref() == null):
			placedSpells.remove_at(i)
		i+=1
	
	while placedSpells.size() < 3:
		place_random_spell()

func place_random_spell():
	var placementOk = false
	while !placementOk:
		var x = randi_range(3, map_width-4)
		var y = randi_range(2, map_height-2)
		var position = Vector2i(x, y)
		
		var globalPosition = global_position + groundMap.map_to_local(position)
		
		var verification = func (node) -> bool:
			return node.global_position == globalPosition
		
		if wallMap.get_cell_atlas_coords(position) != wallTileCoord && !placedSpells.any(verification):
			var flower : Node2D = flowerPackedScene.instantiate()
			wallMap.add_child(flower)
			placedSpells.append(flower)
			flower.global_position = globalPosition
			placementOk = true

func place_spells():
	var placed_spell = 0
	while placed_spell < spell_count :
		place_random_spell()
		placed_spell += 1

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

func get_spell_positions():
	check_flowers()
	var callable = func (node):
		return node.global_position
	return placedSpells.map(callable)
	
func regenerate():
	for coord in tabWall:
		wallMap.erase_cell(coord)
	tabWall.clear()
	for flower in placedSpells:
		flower.queue_free()
	placedSpells.clear()
	place_random_tiles()
	place_spells()
	
	groundMap.notify_runtime_tile_data_update()
	groundMap.update_internals()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	regenerate()

func _physics_process(delta: float) -> void:
	check_flowers()
