#lives
extends Label

#varialbe
var lives := 3
var can_get_hit := true
onready var globalScript = get_node("/root/global")

#display lives as text
func _ready():
	text = String(lives)

#when signal is received minus one live
func _on_Enemy_youDead():
	if can_get_hit: decrease_lives(1)

#function for decreasing lives
func decrease_lives(var amount : int) -> void:
	can_get_hit = false
	lives -= amount
	_ready()
	print(lives)
	if lives == 0:
		get_tree().change_scene("res://Scenes/End.tscn")
	yield(get_tree().create_timer(0.5), "timeout")
	can_get_hit = true

#when signal is received heal one live
func _on_HealPotion_healCollected():
	if lives < 3:
		lives = lives + 1
		_ready()
		print(lives)

#when signal is received minus one live
func _on_hit(body):
	print("bll")
	if body.name == "BeanBoy":
		decrease_lives(1)
	
	
