extends CanvasLayer



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_PlazAgain_pressed() -> void:
	get_tree().change_scene("res://Scenes/Level.tscn")



func _on_EndGame_pressed():
	get_tree().quit()

