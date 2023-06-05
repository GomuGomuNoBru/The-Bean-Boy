extends Node

var menuMusic: AudioStream
var level1Music: AudioStream
var audioPlayer: AudioStreamPlayer

var unlockedLevels = 1

func _input(event):
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
		

var currentLevelScript = null

func startLevel(levelScript):
	if currentLevelScript:
		currentLevelScript.queue_free() # Free the previous level script

	currentLevelScript = levelScript.instance()
	add_child(currentLevelScript)
	currentLevelScript.startLevel()
