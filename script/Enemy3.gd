# fat enemy
extends "res://script/Enemy.gd"


#when signal is received it will spawn enemy with speed 20
func _on_Coins_count_evenMoreEnemy():
	ENEMY_SPEED = 20
	translation = Vector3(1,1,1)
