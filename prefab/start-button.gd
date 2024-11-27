extends Button

func _ready() -> void:
    grab_focus()


func _pressed() -> void:
    UICommon.button_sound.play()
    print_debug("Nothing happens yet lmao")
