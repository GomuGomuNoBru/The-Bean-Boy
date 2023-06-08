#Death
extends Area
 # Replace with function body.



#when players enters it sends him to End scene
func _on_Area_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://Scenes/End.tscn")


