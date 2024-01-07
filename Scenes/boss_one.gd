extends CharacterBody2D

var HEALTH = BossStats.BOSS_ONE_HEALTH

func _physics_process(delta):
	pass

func takeDamage(value):
	HEALTH -= value
	%ProgressBar.value -= value
	if (HEALTH <= 0):
		die()
	
func die():
	queue_free()
	PlayerStats.changePlayerMoney(BossStats.BOSS_ONE_MONEY_VALUE)


func _on_hitbox_area_entered(area):
	if (area.is_in_group("player_projectile")):
		takeDamage(area.getDamage())
