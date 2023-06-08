#Gun
extends Spatial
#takes bullet scene
export(PackedScene) var Bullet

#exported variables
export var muzzle_speed = 30
export var millis_between_shots = 100
#timer
onready var rof_timer = $Timer
#variable
var can_I_shoot_question = 100

#time between each bullet
func _ready():
	rof_timer.wait_time = millis_between_shots / 1000.0

#shooting
func shoot():
	if can_I_shoot_question:
		var new_bullet = Bullet.instance()
		new_bullet.global_transform = $BulletPoint.global_transform
		new_bullet.speed = muzzle_speed
		var scene_root = get_tree().get_root().get_children()[0]
		scene_root.add_child(new_bullet)
		can_I_shoot_question = false
		rof_timer.start()

#delay
func _on_Timer_timeout():
	can_I_shoot_question = true
