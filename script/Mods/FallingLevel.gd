#falling level
extends Spatial


#number of block in level at one point
const NUMBLOCKS = 100

func _ready():
	#takes script
	var MyBoxClass = load("res://script/Mods/SelfManagedBox.gd")
	#creates X's boxes and add child to it
	for _x in range(NUMBLOCKS):
		var my_box = MyBoxClass.new()
		add_child(my_box)
	#plays music
	music_for_level()
	print(get_tree().current_scene.name)

#checks for scene name to play music
func music_for_level():
	MusicController.playSceneMusic(get_tree().current_scene.name)
