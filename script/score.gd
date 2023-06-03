extends Label

signal moreCoins
signal evenMoreCoins
signal moreEnemy
signal evenMoreEnemy
signal enemy
signal goodChance
signal goodChanceSpeed


var score := 0
var chanceHeal = 0.1
var chanceSpeed = 0.3

func _ready():
	text = String(score)
	

func spawnChance():
	if randf() < chanceHeal:
		emit_signal("goodChance")
	if randf() < chanceSpeed:
		emit_signal("goodChanceSpeed")
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
	var currentScene = get_tree().current_scene.name
	print(currentScene)
	if int(currentScene) == 3:
		get_tree().change_scene("res://Scenes/WinScene.tscn")
	else:
		global.unlockedLevels+=1
		get_tree().change_scene("res://Scenes/Levels/Level_"+str(int(get_tree().current_scene.name)+1)+".tscn")
		score =- score
	

	
