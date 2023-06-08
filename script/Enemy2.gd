#speed enemy
extends "res://script/Enemy.gd"


#when signal is received it will spawn enemy with speed 13
func _on_Coins_count_moreEnemy():
	ENEMY_SPEED = 13
	translation = Vector3(1,1,1)
