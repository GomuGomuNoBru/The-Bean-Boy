#basic enemy
extends KinematicBody
#class name
class_name Enemy

#signal
signal youDead

#consts
const WALK_SPEED = 600
const GRAVITY = 600

#onready variables
onready var player = get_node("/root/Level_"+str(int(get_tree().current_scene.name))+"/Player") 
onready var survivePlayer = get_node("/root/Survive/Player")
#enemy's speed
var ENEMY_SPEED= 10

#physics process
func _physics_process(delta):
	if str(get_tree().current_scene.name) != "Survive":
		var player_position = player.global_transform.origin
		var direction_to_target = (player_position - global_transform.origin).normalized() # We normalize the vector because we only care about the direction
		move_and_slide(direction_to_target * ENEMY_SPEED) # We multiply the direction by the speed
		
	else:
		var player_position = survivePlayer.global_transform.origin
		var direction_to_target = (player_position - global_transform.origin).normalized() # We normalize the vector because we only care about the direction
		move_and_slide(direction_to_target * ENEMY_SPEED) # We multiply the direction by the speed
	
#when comes in contact with player it sends signal
func _on_Area_body_entered(body):
	if body.name == "Player":
		emit_signal("youDead")

#when signal is received it will spawn enemy
func _on_Coins_count_enemy():
	translation = Vector3(1,1,1)

#when it runs out of HP it dies
func _on_Stats_you_died():
	queue_free()
