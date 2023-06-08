#Level uncloked
extends PanelContainer
#signal
signal level_selected
#variables
var locked = true setget set_locked
var level_num = 1 setget set_level
onready var label = $Label
onready var lock = $MarginContainer

#lock level
func set_locked(value):
	locked = value
	lock.visible = value
	label.visible = not value
#level
func set_level(value):
	level_num = value
	label.text = str(level_num)

#when pressed send signal but only when it is unlocked
func _on_LevelIcon_gui_input(event):
	if locked:
		return
	if event is InputEventMouseButton and event.pressed:
		print("Clicked level ", level_num)
		emit_signal("level_selected", level_num)


