#level 1
extends Spatial

#plays musci for level 1
func _ready():
	MusicController.playSceneMusic(get_tree().current_scene.name)
	print(get_tree().current_scene.name)
