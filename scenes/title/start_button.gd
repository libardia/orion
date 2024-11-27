extends Button


func _ready() -> void:
	UICommon.silent_focus_change(self)


func _pressed() -> void:
	UICommon.button_sound.play()
	SceneManager.change_scene(preload("res://scenes/level/level.tscn"))
