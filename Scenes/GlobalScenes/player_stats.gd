extends Node

# Values
var PLAYER_HEALTH : int = 100
var PLAYER_SPEED : int = 600
var MONEY : int = 0

# Weapons
var WEAPON_SLOT_1 : PackedScene = null
var WEAPON_SLOT_2 : PackedScene = null
var WEAPON_SLOT_3 : PackedScene = null
var WEAPON_SLOT_4 : PackedScene = null

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
func setPlayerMoney(value:int):
	MONEY = value
func changePlayerMoney(value:int):
	MONEY += value
	
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
		return null # Invalid value

func setWeaponInSlot(slot:int, weapon:PackedScene):
	if slot == 1:
		WEAPON_SLOT_1 = weapon
	if slot == 2:
		WEAPON_SLOT_2 = weapon
	if slot == 3:
		WEAPON_SLOT_3 = weapon
	if slot == 4:
		WEAPON_SLOT_4 = weapon


