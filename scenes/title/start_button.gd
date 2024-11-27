extends Button


func _ready() -> void:
	UICommon.silent_focus_change(self)


func _pressed() -> void:
	print_debug("PRESSED!?!?!?!?")
	UICommon.button_sound.play()
	var sc = preload("res://scenes/level/level.tscn")
	print_debug("To change: %s" % sc)
	SceneManager.change_scene(sc)
