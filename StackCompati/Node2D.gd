extends Node2D


func _ready():
	var a : TileSetAtlasSource = TileSetAtlasSource.new()
	var image = Image.load_from_file("res://icon.svg")
	var tex : ImageTexture =  ImageTexture.create_from_image(image)
	a.texture = tex
	var setTS : TileSet = TileSet.new()
	var source_id = setTS.add_source(a, 0)
	$TileMap.tile_set = setTS
	_setup_tile_atlas(a, Vector2(16,16))
	for x in 8:
		for y in 8:
			$TileMap.set_cell(0, Vector2i(x, y), 0, Vector2i(x, y))
	
func _setup_tile_atlas(atlas: TileSetAtlasSource, tile_size: Vector2i) -> void:
	atlas.texture_region_size = tile_size  # Vector2(16, 16)
	atlas.use_texture_padding = true
	var atlas_size = atlas.get_atlas_grid_size()  # Vector2(8, 8) cause smaller image
	for y in atlas_size.y:
		for x in atlas_size.x:
			var coord = Vector2i(x, y)
			atlas.create_tile(coord)
			print(coord)
			print(atlas.has_tile(coord))
			print(atlas.get_tile_size_in_atlas(coord))
			print(atlas.get_tile_texture_region(coord))

