#heal potions
extends Area

#signal
signal healCollected

#rotate
func _physics_process(delta):
	rotate_y(deg2rad(2))

#when players enters it sends signal and destroys it self
func _on_HealPotion_body_entered(body):
	if body.name == "Player":
		emit_signal("healCollected")
		self.queue_free()


#when signal is received it will spawn
func _on_Coins_count_goodChance():
	translation = Vector3(1, 1, 1)


