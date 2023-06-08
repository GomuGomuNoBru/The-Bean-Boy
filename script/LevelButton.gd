#button
extends Button

#file path/variables
export(String, FILE) var level_path
onready var globalScript = get_node("/root/global")
var original_size = rect_scale
var grow_size = Vector2(1.1, 1.1)

#button hover
func _on_LvlButton_mouse_entered() -> void:
	grow_size_tween(grow_size, .1)
func _on_LvlButton_mouse_exited() -> void:
	grow_size_tween(original_size, .1)
	
#changing mouse size
func grow_size_tween(end_size, duration):
	var tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, 'rect_scale', end_size, duration)

#when button pressed go to level
func _on_LvlBtn_pressed() -> void:
	if !level_path:
		return
	get_tree().change_scene(level_path)
