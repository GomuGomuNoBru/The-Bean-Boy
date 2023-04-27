extends Area

signal healCollected

func _ready():
	pass


func _physics_process(delta):
	rotate_y(deg2rad(2))


func _on_Potion_body_entered(body):
	if body.name == "Player":
		emit_signal("healCollected")
	self.queue_free()
