#Start scene/Menu scene
extends CanvasLayer
#variables
export(String, FILE) var level

onready var settings_menu = $SettingsMenu
onready var start_btn = $MainMenu/MarginContainer/VBoxContainer/StartGameBtn

func _ready():
	start_btn.grab_focus()
#
func _on_StartGameBtn_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene(level)

#settings button
func _on_SettingsBtn_pressed():
	settings_menu.popup_centered()

#exit button
func _on_ExitBtn_pressed():
	get_tree().quit()
