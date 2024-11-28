extends Node2D


@export
var features: Array[Texture] = []
@export
var feature_weights: Array[int] = []
@export
var num_features: int = 100
@export
var feature_scale: float = 1
@export
var overscan: float = 10


func _ready() -> void:
	assert(features.size() == feature_weights.size(), "Feature and feature weight arrays must be the same length.")

	var weight_total = 0
	for w in feature_weights:
		weight_total += w

	for _i in num_features:
		# Pick a random texture (weighted)
		var rand = randi() % weight_total
		for i in feature_weights.size():
			var w = feature_weights[i]
			if rand < w:
				spawn(features[i])
				break
			rand -= w

func spawn(texture: Texture):
	var sp: Sprite2D = Sprite2D.new()
	sp.texture = texture

	var vp = get_viewport_rect().size
	var x = (randf() * (vp.x + overscan)) - overscan / 2
	var y = (randf() * (vp.y + overscan)) - overscan / 2
	sp.position = Vector2(x, y)
	sp.scale = Vector2(feature_scale, feature_scale)

	add_child(sp)
