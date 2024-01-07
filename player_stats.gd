extends Node

# Values
var PLAYER_HEALTH : int = 100
var PLAYER_SPEED : int = 600
var MONEY : int = 0

# Weapons
var WEAPON_SLOT_1 : PackedScene
var WEAPON_SLOT_2 : PackedScene
var WEAPON_SLOT_3 : PackedScene
var WEAPON_SLOT_4 : PackedScene

var UPGRADES = []

# Setters
func setPlayerHealth(value:int):
	PLAYER_HEALTH = value
func changePlayerHealth(value:int):
	PLAYER_HEALTH += value
func setPlayerSpeed(value:int):
	PLAYER_SPEED = value
func changePlayerSpeed(value:int):
	PLAYER_SPEED += value
	
func getWeaponFromSlot(value:int):
	if value == 1:
		return WEAPON_SLOT_1
	elif value == 2:
		return WEAPON_SLOT_2
	elif value == 3:
		return WEAPON_SLOT_3
	elif value == 4:
		return WEAPON_SLOT_4
	else:
		return -1 # Invalid value



