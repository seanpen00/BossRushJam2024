extends Node2D
@export var Sprite : Sprite2D
@export var Hurtbox : Area2D
@export var HurtboxCollider : CollisionShape2D
@export var Hitbox : Area2D
@export var HitboxCollider : CollisionShape2D
@export var HealthBar : ProgressBar

@export var HEALTH : int
@export var MONEY_VALUE : int
@export var WEAPON_LIST : Array[PackedScene]
@export var ATTACK_COOLDOWN_1 : float
@export var ATTACK_COOLDOWN_2 : float
@export var ATTACK_COOLDOWN_3 : float
var canAttack_1 : bool = true
var canAttack_2 : bool = true
var canAttack_3 : bool = true
var player : CharacterBody2D

func _ready():
	$AttackCooldown_1.wait_time = ATTACK_COOLDOWN_1
	$AttackCooldown_2.wait_time = ATTACK_COOLDOWN_2
	$AttackCooldown_3.wait_time = ATTACK_COOLDOWN_3

func _physics_process(delta):
	if canAttack_1 and WEAPON_LIST.size() > 0:
		attack_1()
	if canAttack_2 and WEAPON_LIST.size() > 1:
		attack_2()
	if canAttack_3 and WEAPON_LIST.size() > 2:
		attack_3()

func attack_1():
	if (WEAPON_LIST[0]):
		canAttack_1 = false
		$AttackCooldown_1.start()
		var currentWeapon = WEAPON_LIST[0].instantiate()
		owner.add_child(currentWeapon)
		currentWeapon.transform = $ProjectileOrigin.global_transform
		
func attack_2():
	if (WEAPON_LIST[1]):
		canAttack_2 = false
		$AttackCooldown_2.start()
		var currentWeapon = WEAPON_LIST[1].instantiate()
		owner.add_child(currentWeapon)
		currentWeapon.transform = $ProjectileOrigin.global_transform

func attack_3():
	if (WEAPON_LIST[2]):
		canAttack_3 = false
		$AttackCooldown_3.start()
		var currentWeapon = WEAPON_LIST[2].instantiate()
		owner.add_child(currentWeapon)
		currentWeapon.transform = $ProjectileOrigin.global_transform

func takeDamage(value):
	HEALTH -= value
	HealthBar.value -= value
	if (HEALTH <= 0):
		die()
	
func die():
	queue_free()
	PlayerStats.changePlayerMoney(MONEY_VALUE)

func _on_hitbox_area_entered(area):
	if (area.is_in_group("player_projectile")):
		takeDamage(area.getDamage())

# Attack Cooldowns

func _on_attack_cooldown_1_timeout():
	canAttack_1 = true


func _on_attack_cooldown_2_timeout():
	canAttack_2 = true


func _on_attack_cooldown_3_timeout():
	canAttack_3 = true
