extends Label

signal moreCoins
signal evenMoreCoins
signal moreEnemy
signal evenMoreEnemy
signal enemy
signal goodChance

var score := 0
var chance = 0.2

func _ready():
	text = String(score)
	

func spawnChance():
	if randf() < chance:
		emit_signal("goodChance")
	print(randf())

func _on_coin_coinCollected():
	score += 1
	spawnChance()
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

func _next_level():
	global.unlockedLevels+=1
	get_tree().change_scene("res://Scenes/Levels/Level_"+str(int(get_tree().current_scene.name)+1)+".tscn")
	score =- score
	

	
