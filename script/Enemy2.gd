#speed enemy
extends "res://script/Enemy.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _on_Coins_count_moreEnemy():
	ENEMY_SPEED = 15
	translation = Vector3(1,1,1)
