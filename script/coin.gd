extends Area

signal coinCollected
onready var rng = RandomNumberGenerator.new()
var rng_max = 19
var rng_min = -19

func _ready():
	pass


func _physics_process(delta):
	rotate_y(deg2rad(2))


func _on_coin_body_entered(body):
	if body.name == "Player":
		var ran : int = rng.randf_range(rng_min, rng_max)
		var ran2 : int = rng.randf_range(rng_min, rng_max)
		translation = Vector3(ran, 1, ran2)
		print(ran," ",ran2)
		emit_signal("coinCollected")


