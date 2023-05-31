extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	MusicController.playSceneMusic(get_tree().current_scene.name)
	


func _on_PlazAgain_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level_"+str(global.unlockedLevels)+".tscn")

func _on_LevelSelect_pressed():
	get_tree().change_scene("res://Scenes/Levels.tscn")

func _on_EndGame_pressed():
	get_tree().quit()

func _on_GoMenu_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")

