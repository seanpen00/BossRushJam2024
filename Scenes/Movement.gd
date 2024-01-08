extends CharacterBody2D

var currentWeapon
var weaponSlot = 0

# Boolean to know if can use
var weapon_1_canUse : bool = true
var weapon_2_canUse : bool = true
var weapon_3_canUse : bool = true
var weapon_4_canUse : bool = true

# Cooldowns for each slot
var weapon_1_cooldown : float = .3
var weapon_2_cooldown : float = 1
var weapon_3_cooldown : float = 2
var weapon_4_cooldown : float = 3

func _ready():
	PlayerStats.setWeaponInSlot(1,Weapons.BULLET_PROJECTILE)
	PlayerStats.setWeaponInSlot(2,Weapons.PEBBLE_PROJECTILE)
	pass

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * PlayerStats.PLAYER_SPEED
	move_and_slide()
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and weaponSlot != 0:
		if (weaponSlot == 1 and weapon_1_canUse):
			attack(weaponSlot)
			weapon_1_canUse = false
			$Weapon1Timer.wait_time = weapon_1_cooldown
			$Weapon1Timer.start()
		if (weaponSlot == 2 and weapon_2_canUse):
			attack(weaponSlot)
			weapon_2_canUse = false
			$Weapon2Timer.wait_time = weapon_2_cooldown
			$Weapon2Timer.start()
		if (weaponSlot == 3 and weapon_3_canUse):
			attack(weaponSlot)
			weapon_3_canUse = false
			$Weapon3Timer.wait_time = weapon_3_cooldown
			$Weapon3Timer.start()
		if (weaponSlot == 4 and weapon_4_canUse):
			attack(weaponSlot)
			weapon_4_canUse = false
			$Weapon4Timer.wait_time = weapon_4_cooldown
			$Weapon4Timer.start()
	if event.is_action_pressed("weapon_1"):
		weaponSlot = 1
		$Control.get_child(0).text = "Weapon Selected: 1";
	if event.is_action_pressed("weapon_2"):
		weaponSlot = 2
		$Control.get_child(0).text = "Weapon Selected: 2";
	if event.is_action_pressed("weapon_3"):
		weaponSlot = 3
		$Control.get_child(0).text = "Weapon Selected: 3";
	if event.is_action_pressed("weapon_4"):
		weaponSlot = 4
		$Control.get_child(0).text = "Weapon Selected: 4";

func attack(weaponSlot):
	if (PlayerStats.getWeaponFromSlot((weaponSlot))):
		currentWeapon = PlayerStats.getWeaponFromSlot(weaponSlot).instantiate()
		owner.add_child(currentWeapon)
		currentWeapon.transform = $ProjectileOrigin.global_transform
		
func takeDamage(value):
	PlayerStats.changePlayerHealth(value)
	changeHealth()
	if (PlayerStats.PLAYER_HEALTH <= 0):
		die()
	
func die():
	queue_free()
	PlayerStats.setPlayerMoney(0)

func changeHealth():
	$HealthBar.value = PlayerStats.PLAYER_HEALTH


func _on_weapon_1_timer_timeout():
	weapon_1_canUse = true


func _on_weapon_2_timer_timeout():
	weapon_2_canUse = true


func _on_weapon_3_timer_timeout():
	weapon_3_canUse = true


func _on_weapon_4_timer_timeout():
	weapon_4_canUse = true
