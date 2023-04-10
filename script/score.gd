extends Label

signal moreCoins
signal evenMoreCoins
signal moreEnemy
signal evenMoreEnemy
signal enemy

var score := 0

func _ready():
	text = String(score)



func _on_coin_coinCollected():
	score += 1
	_ready()
	if score == 1:
		emit_signal("enemy")
	if score == 5:
		emit_signal("moreCoins")
	if score == 10:
		emit_signal("evenMoreCoins")
		emit_signal("moreEnemy")
	if score == 20:
		emit_signal("evenMoreEnemy")
	if score == 30:
		_next_level()

func _next_level() -> void:
	get_tree().change_scene("res://Scenes/Level_"+str(int(get_tree().current_scene.name)+1)+".tscn")
	score = score - score


