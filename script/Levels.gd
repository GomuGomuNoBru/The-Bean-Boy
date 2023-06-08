#Levels
extends Control
#variables
const LevelButton = preload("res://Scenes/LevelButton.tscn")
export(String, DIR) var dir_path = ""
onready var grid = $MarginContainer/VBoxContainer/levels

#takes levels path
func _ready():
	read_dir(dir_path)
	

#stuff
func read_dir(path):
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin(true)
		var file_name = dir.get_next()
		while file_name != "":
			print(file_name)
			create_level_btn('%s/%s' % [dir.get_current_dir(), file_name], file_name)
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		print("An error occurred when trying to access the path.")
		
#creats level button
func create_level_btn(lvl_path, lvl_name):
	var btn = LevelButton.instance()
	btn.text = lvl_name.trim_suffix('.tscn').replace('_', " ")
	btn.level_path = lvl_path
	if int(lvl_name) <= global.unlockedLevels:
		btn.disabled = false
	else:
		btn.disabled = true
	grid.add_child(btn)
	
		
#go back button
func _on_Button_Go_Back_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
	
