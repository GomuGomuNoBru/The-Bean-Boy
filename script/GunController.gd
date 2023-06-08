#Gun Controller
extends Node

#variables
export(PackedScene) var StartingWeapon
var hand: Position3D
var equipped_weapon: Spatial

# Called when the node enters the scene tree for the first time.
func _ready():
	
	if str(get_tree().current_scene.name) == "Survive":
		hand = get_parent().find_node("hand")
		if StartingWeapon:
			equip_weapon(StartingWeapon)


#is weapon equped or not
func equip_weapon(weapon_to_equip):
	if equipped_weapon:
		equipped_weapon.queue_free()
	else:
		equipped_weapon = weapon_to_equip.instance()
		hand.add_child(equipped_weapon)
		
#shoot
func shoot():
	if equipped_weapon:
		equipped_weapon.shoot()
