extends Area


signal potionCollected

func _ready():
	pass


func _physics_process(delta):
	rotate_y(deg2rad(2))


func _on_SpeedPotion_body_entered(body):
	if body.name == "Player":
		emit_signal("potionCollected")
	self.queue_free()


