extends Node

var unlockedLevels = 1
"""
const file_path = "save.data"
var data = {}

func _ready():
	load_data()

func load_data():
	var file = File.new()
	if file.file_exists("user://"+file_path):
		file.open("user://"+file_path, File.READ)
		data = file.get_var()
		file.close()
	else:
		data = {
			"Unlocked": {}
		}

func save_data():
	var file = File.new()
	file.open("user://"+file_path, File.WRITE)
	file.store_var(data)
	file.close()
"""
func _input(event):
	if event.is_action_pressed("fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
		
