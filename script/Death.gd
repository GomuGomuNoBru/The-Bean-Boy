extends Area

func _ready():
	pass # Replace with function body.




func _on_Area_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Scenes/End.tscn")


