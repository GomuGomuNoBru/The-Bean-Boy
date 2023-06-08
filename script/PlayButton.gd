#buttons
extends CanvasLayer
#variable
onready var settings_menu = $SettingsMenu

#play music
func _ready():
	pass # Replace with function body.
	MusicController.playSceneMusic(get_tree().current_scene.name)
	

#play again button
func _on_PlazAgain_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level_"+str(global.unlockedLevels)+".tscn")
	
#go to levels scene
func _on_LevelSelect_pressed():
	get_tree().change_scene("res://Scenes/Levels.tscn")

#quit game
func _on_EndGame_pressed():
	get_tree().quit()

#go to game mods scene
func _on_GameMods_pressed():
	get_tree().change_scene("res://Scenes/Mods.tscn")

#go to settings
func _on_Settings_pressed():
	settings_menu.popup_centered()

#go to menu
func _on_GoMenu_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
