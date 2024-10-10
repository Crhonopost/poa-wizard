extends TileMap

var map_width = 10
var map_height = 10

#id de la tuile a rajouter
var tile_id =  10

#nombre tuiles aleatoires
var tile_count = 100


func place_random_tiles():
	var placed_tiles = 0
	while placed_tiles < tile_count:
		var x = int(randf_range(-map_width, map_width))
		var y = int(randf_range(-map_height, map_height))
		var position = Vector2(x, y)

		# Vérifie si une tuile est déjà placée à cette position dans le layer foreground
		if get_cell_source_id(0, position) != 1:
			# Place la tuile à la position générée
			set_cell(0, position, tile_id)
			placed_tiles += 1



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	place_random_tiles()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
