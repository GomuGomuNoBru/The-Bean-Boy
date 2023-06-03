extends Spatial

func _ready():
	MusicController.playSceneMusic(get_tree().current_scene.name)
	print(get_tree().current_scene.name)
	
