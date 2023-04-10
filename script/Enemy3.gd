# fat enemy
extends "res://script/Enemy.gd"


func _ready():
	pass # Replace with function body.


func _on_Coins_count_evenMoreEnemy():
	ENEMY_SPEED = 20
	translation = Vector3(1,1,1)
