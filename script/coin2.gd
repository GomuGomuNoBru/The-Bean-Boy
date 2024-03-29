#coin2
extends "res://script/coin.gd"


#rotates coin
func _physics_process(delta):
	rotate_y(deg2rad(2))


#when coin is collected by  Player it sends signal a respawns somewhere else
func _on_coin_body_entered(body):
	if body.name == "Player":
		rng.randomize()
		var ran : int = rng.randf_range(rng_min, rng_max)
		var ran2 : int = rng.randf_range(rng_min, rng_max)
		translation = Vector3(ran, 1, ran2)
		emit_signal("coinCollected")

#when signal is received spawns coin
func _on_Label2_moreCoins():
	var ran : int = rng.randf_range(rng_min, rng_max)
	var ran2 : int = rng.randf_range(rng_min, rng_max)
	translation = Vector3(ran,1,ran2)


