extends Node

var menuMusic = load("res://Music/Tamkish - Untitled Stuff vol.1 - 01 menu.mp3")
var level1Music = load("res://Music/Tamkish - Untitled Stuff vol.1 - 03 level1.mp3")
var level2Music = load("res://Music/Tamkish - Untitled Stuff vol.1 - 04 level2.mp3")
var level3Music = load("res://Music/Tamkish - Untitled Stuff vol.1 - 05 level3.mp3")


func _ready():
	pass
	 
func stopCurrentMusic():
	$Music.stop()
	$Music.stream = null

func playSceneMusic(sceneName: String):
	stopCurrentMusic()

	match sceneName:
		"Menu":
			$Music.stream = menuMusic
		"End":
			$Music.stream = menuMusic
		"Level_1":
			$Music.stream = level1Music
		"Level_2":
			$Music.stream = level2Music
		"Level_3":
			$Music.stream = level3Music

	$Music.volume_db = -50
	$Music.play()


	
