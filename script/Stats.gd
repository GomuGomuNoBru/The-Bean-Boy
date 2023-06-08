#stats
extends Node
#class stats
class_name Stats

#variables
export var max_HP = 10
var current_HP = max_HP
signal you_died

#when hit taken decres HP by 1
func take_hit(demage):
	current_HP -= 1
	print(current_HP, "/10")
	if current_HP <= 0:
		die()

#when dead then dead
func die():
	emit_signal("you_died")
