#Music node
extends Node

#loads music
var menuMusic = load("res://Music/Tamkish - Untitled Stuff vol.1 - 01 menu.mp3")
var level1Music = load("res://Music/Tamkish - Untitled Stuff vol.1 - 03 level1.mp3")
var level2Music = load("res://Music/Tamkish - Untitled Stuff vol.1 - 04 level2.mp3")
var level3Music = load("res://Music/Tamkish - Untitled Stuff vol.1 - 05 level3.mp3")
var fallingLevelMusic = load("res://Music/Tamkish - Untitled Stuff vol.1 - 07 info.mp3")
var surviveLevelMusic = load("res://Music/Tamkish - Untitled Stuff vol.1 - 06 battle.mp3")

#stops current music
func stopCurrentMusic():
	$Music.stop()
	$Music.stream = null

#plays correct music based of scene 
func playSceneMusic(sceneName: String):
	stopCurrentMusic()
	
	#takes scene name and matches it with correct music
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
		"Falling":
			$Music.stream = fallingLevelMusic
		"Survive":
			$Music.stream = surviveLevelMusic

	#sets music volume
	$Music.volume_db = -50
	#plays music
	$Music.play()


	
