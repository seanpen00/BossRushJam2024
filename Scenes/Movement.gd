extends CharacterBody2D

var currentWeapon
var weaponSlot = 0

func _ready():
	PlayerStats.setWeaponInSlot(1,Weapons.BULLET)
	PlayerStats.setWeaponInSlot(2,Weapons.BULLET)
	pass

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * PlayerStats.PLAYER_SPEED
	move_and_slide()
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		attack(weaponSlot)
	if event.is_action_pressed("weapon_1"):
		weaponSlot = 1
	if event.is_action_pressed("weapon_2"):
		weaponSlot = 2
	if event.is_action_pressed("weapon_3"):
		weaponSlot = 3
	if event.is_action_pressed("weapon_4"):
		weaponSlot = 4

func attack(weaponSlot):
	currentWeapon = PlayerStats.getWeaponFromSlot(weaponSlot).instantiate()
	owner.add_child(currentWeapon)
	currentWeapon.transform = $ProjectileOrigin.global_transform

	
