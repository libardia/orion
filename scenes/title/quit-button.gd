extends Button

var should_quit = false


func _pressed() -> void:
	UICommon.quit_sound.play()
	should_quit = true


func _process(_delta: float) -> void:
	if should_quit and not UICommon.quit_sound.playing:
		get_tree().quit()
