#Enemy Spawner
extends Spatial
#takes enemy scene
export(PackedScene) var Enemy
#timer
onready var time = $Timer

#exported variables
export var num_of_enemys = 3
export var sec_between_spawns: float = 2

#variables
var enemies_remaining_to_spawn
var enemies_killed_this_wave

var waves 
var current_wave: Wave
var current_wave_num = -1

#makes waves array and starts next wave
func _ready():
	waves = $Waves.get_children()
	print("Waves:", waves)
	start_next_wave()

#function to start new waves 
func start_next_wave():
	enemies_killed_this_wave = 0
	current_wave_num += 1
	if current_wave_num < waves.size():
		current_wave = waves[current_wave_num]
		print(current_wave)
		enemies_remaining_to_spawn = current_wave.num_of_enemys
		time.wait_time = current_wave.sec_between_spawns
		time.start()

#connect Enemy stats with enemys and player lives
func connect_to_enemy_signal(enemy: Enemy):
	var stats: Stats = enemy.get_node("Stats")
	stats.connect("you_died", self,"_on_Enemy_Stats_you_died")
	enemy.connect("youDead",LivesCount,"_on_Enemy_youDead")

#number of enemys you killed this wave
func _on_Enemy_Stats_you_died():
	enemies_killed_this_wave += 1
	print("enemies killed: ", enemies_killed_this_wave)

#if there are no enemys and you killed all of them it starts next wave
func _on_Timer_timeout():
	if enemies_remaining_to_spawn:
		var enemy = Enemy.instance()
		connect_to_enemy_signal(enemy)
		var scene_root = get_parent()
		scene_root.add_child(enemy)
		enemies_remaining_to_spawn -=1
	else:
		if enemies_killed_this_wave == current_wave.num_of_enemys:
			start_next_wave()
