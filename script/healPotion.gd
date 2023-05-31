extends Area

signal healCollected

func _ready():
	pass


func _physics_process(delta):
	rotate_y(deg2rad(2))


func _on_HealPotion_body_entered(body):
	if body.name == "Player":
		emit_signal("healCollected")
	self.queue_free()


func _on_Coins_count_goodChance():
	translation = Vector3(1, 1, 1)


