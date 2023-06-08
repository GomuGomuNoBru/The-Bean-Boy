#Game Mods 
extends Control

#on click changes scene to...
func _on_Button_Go_Back_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")

#on click changes scene to...
func _on_Survive_pressed():
	get_tree().change_scene("res://Scenes/Mods/survive_.tscn")

#nothing
func _on_TimeSurvive_pressed():
	pass # Replace with function body.

#nothing
func _on_Mystery_pressed():
	pass # Replace with function body.

#on click changes scene to...
func _on_Falling_pressed():
	get_tree().change_scene("res://Scenes/Mods/falling_.tscn")
