extends "res://script/Enemy.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Coins_count_evenMoreEnemy():
	ENEMY_SPEED = 20
	translation = Vector3(1,1,1)
