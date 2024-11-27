class_name UICommon
extends Node

static var context: Node = null
static var focus_sound: AudioStreamPlayer = null
static var button_sound: AudioStreamPlayer = null
static var quit_sound: AudioStreamPlayer = null

static var next_change_silent: bool = false


func _ready() -> void:
	UICommon.context = self
	UICommon.focus_sound = %FocusSound
	UICommon.button_sound = %ButtonSound
	UICommon.quit_sound = %QuitSound
	get_viewport().connect("gui_focus_changed", _on_focus_change)


func _on_focus_change(_control: Control) -> void:
	if not next_change_silent:
		focus_sound.play()
	next_change_silent = false


static func silent_focus_change(control: Control) -> void:
	next_change_silent = true
	control.grab_focus()


static func quit() -> void:
	quit_sound.play()
	await quit_sound.finished
	context.get_tree().quit()
