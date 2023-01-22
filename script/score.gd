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





