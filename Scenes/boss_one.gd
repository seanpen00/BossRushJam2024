extends CharacterBody2D

var HEALTH = 100

func _physics_process(delta):
	pass

func takeDamage(value):
	HEALTH -= value
	%ProgressBar.value -= value
	if (HEALTH <= 0):
		die()
	
func die():
	queue_free()


func _on_hitbox_area_entered(area):
	if (area.has_method("getDamage")):
		takeDamage(area.getDamage())
