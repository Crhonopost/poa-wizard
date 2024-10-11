extends TileMap

var map_width = 11
var map_height = 7

#id de la tuile a rajouter
var tile_id =  1

#nombre tuiles aleatoires
var tile_count = 60
var spell_count = 4

var tabWall = []
var tabSpell = []

func place_spell():
	var placed_spell = 0
	while placed_spell < spell_count :
		var x = int(randf_range(-map_width+3, map_width-4))
		var y = int(randf_range(-map_height-2, map_height))
		var position = Vector2i(x, y)
		
		if get_cell_atlas_coords(0,position) == Vector2i(16,5):
			tabSpell.append(position)
			set_cell(1, position, 0,Vector2i(9, 5))
			placed_spell += 1


func place_random_tiles():
	var placed_tiles = 0
	while placed_tiles < tile_count:
		var x = int(randf_range(-map_width+1, map_width-2))
		var y = int(randf_range(-map_height-2, map_height))
		var position = Vector2i(x, y)


		# Vérifie si une tuile est déjà placée à cette position dans le layer foreground
		if get_cell_atlas_coords(0,position) == Vector2i(16,5):
			tabWall.append(position)
			# Place la tuile à la position générée
			set_cell(0, position, 0,Vector2i(15, 11))
			placed_tiles += 1



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_cell_atlas_coords(0,Vector2i(0, 0)))
	place_random_tiles()
	place_spell()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
