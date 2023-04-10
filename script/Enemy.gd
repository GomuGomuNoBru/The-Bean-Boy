#basic enemy
extends KinematicBody

signal youDead

const WALK_SPEED = 600
const GRAVITY = 600


onready var player = get_node("/root/Level_"+str(int(get_tree().current_scene.name))+"/Player")



func _ready():
	pass # Replace with function body.

var ENEMY_SPEED= 10
func _physics_process(delta):
	var player_position = player.global_transform.origin
	var direction_to_target = (player_position - global_transform.origin).normalized() # We normalize the vector because we only care about the direction
	move_and_slide(direction_to_target * ENEMY_SPEED) # We multiply the direction by the speed
	
func _on_Area_body_entered(body):
	if body.name == "Player":
		emit_signal("youDead")



func _on_Coins_count_enemy():
	translation = Vector3(1,1,1)

