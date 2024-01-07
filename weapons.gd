extends Node

# BULLET
var BULLET_PROJECTILE : PackedScene = preload("res://Scenes/Weapons/Bullet/bullet.tscn")
var BULLET_DAMAGE : int = 3
var BULLET_RANGE : int = 1000
var BULLET_SPEED : int = 1200
# On Pick-up (value for player)
var BULLET_COOLDOWN : float = .5

# PEBBLE
var PEBBLE_PROJECTILE : PackedScene = preload("res://Scenes/Weapons/Pebble/pebble.tscn")
var PEBBLE_DAMAGE : int = 15
var PEBBLE_RANGE : int = 500
var PEBBLE_SPEED : int = 200
# On Pick-up (value for player)
var PEBBLE_COOLDOWN : float = .5
