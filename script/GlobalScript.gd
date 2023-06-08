#Global Script
extends Node

#signals:
signal fps_displayed(value)
signal bloom_toggled(value)
signal brightness_updated(value)
signal fov_updated(value)
signal mouse_sens_updated(value)

#variables for music
var menuMusic: AudioStream
var level1Music: AudioStream
var audioPlayer: AudioStreamPlayer
#variable 
var unlockedLevels = 1

#fullscreen toggle
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



#fullscreen toggle
func toggle_fullscreen(toggle):
	OS.window_fullscreen = toggle
	Save.game_data.fullscreen_on = toggle
	Save.save_data()
	

#vsync toggle	
func toggle_vsync(toggle):
	OS.vsync_enabled = toggle
	Save.game_data.vsync_on = toggle
	Save.save_data()
	

#fps toggle
func toggle_fps_display(toggle):
	emit_signal("fps_displayed", toggle)
	Save.game_data.display_fps = toggle
	Save.save_data()
	
#set max fps
func set_max_fps(value):
	Engine.target_fps = value if value < 500 else 0
	Save.game_data.max_fps = Engine.target_fps if value < 500 else 500
	Save.save_data()
	

#bloom toggle
func toggle_bloom(value):
	emit_signal("bloom_toggled", value)
	Save.game_data.bloom_on = value
	Save.save_data()
	

#brightness level
func update_brightness(value):
	emit_signal("brightness_updated", value)
	Save.game_data.brightness = value
	Save.save_data()
	

#music vol	master
func update_master_vol(vol):
	AudioServer.set_bus_volume_db(0, vol)
	Save.game_data.master_vol = vol
	Save.save_data()
	
	
#music vol
func update_music_vol(vol):
	AudioServer.set_bus_volume_db(1, vol)
	

#music vol sfx
func update_sfx_vol(vol):
	AudioServer.set_bus_volume_db(2, vol)
	
#fov update
func update_fov(value):
	emit_signal("fov_updated", value)
	Save.game_data.fov = value
	Save.save_data()
	
#mouse sens update
func update_mouse_sens(value):
	emit_signal("mouse_sens_updated", value)
	Save.game_data.mouse_sens = value
	Save.save_data()
