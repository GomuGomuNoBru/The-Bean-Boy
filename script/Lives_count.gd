extends Label


var lives := 2
var can_get_hit := true

func _ready():
	text = String(lives)


func _on_Enemy_youDead():
	if can_get_hit: decrease_lives(1)


func decrease_lives(var amount : int) -> void:
	can_get_hit = false
	lives -= amount
	_ready()
	print(lives)
	if lives == 0:
		get_tree().change_scene("res://Scenes/End.tscn")
	yield(get_tree().create_timer(0.5), "timeout")
	can_get_hit = true


func _on_HealPotion_healCollected():
	if lives < 3:
		lives = lives + 1
		_ready()
		print(lives)
		


