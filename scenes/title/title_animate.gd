extends Label


@export
var rotation_speed: float = 1
@export
var scale_speed: float = 1
@export
var scale_variation: float = 0.25
@export
var rotation_variation: float = 15

var t = 0


func _ready() -> void:
    pivot_offset = size / 2


func _process(delta: float) -> void:
    rotation_degrees = sin(t * rotation_speed) * rotation_variation
    var scale_offset = (sin(t * scale_speed) * scale_variation)
    scale = Vector2(1 + scale_offset, 1 - scale_offset)
    t += delta
