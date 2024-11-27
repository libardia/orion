class_name SceneManager
extends Node


@export
var initial_scene: PackedScene

static var context: Node = null
static var active_scene_root: Node = null
static var active_scene: Node = null


func _ready():
	SceneManager.context = self
	SceneManager.active_scene_root = %ActiveScene
	SceneManager.change_scene(initial_scene)


static func change_scene(scene: PackedScene) -> void:
	print_debug("Context: %s" % context)
	print_debug("Active root: %s" % active_scene_root)
	print_debug("Packed: %s" % scene)
	print_debug("Previous: %s" % active_scene)
	if active_scene != null:
		active_scene_root.remove_child(active_scene)
		active_scene.free()
	var new_scene: Node = scene.instantiate()
	print_debug("Instantiated new: %s" % new_scene)
	active_scene_root.add_child(new_scene)
	active_scene = new_scene
	print_debug("New active scene: %s" % new_scene)
