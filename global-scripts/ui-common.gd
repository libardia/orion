class_name UICommon

static var focus_sound: AudioStreamPlayer = null
static var button_sound: AudioStreamPlayer = null
static var quit_sound: AudioStreamPlayer = null


static func init(initializer: Node) -> void:
	focus_sound = initializer.get_node("%focus_sound")
	button_sound = initializer.get_node("%button_sound")
	quit_sound = initializer.get_node("%quit_sound")
	initializer.get_viewport().connect("gui_focus_changed", _on_focus_change)


static func _on_focus_change(_control: Control) -> void:
	focus_sound.play()
