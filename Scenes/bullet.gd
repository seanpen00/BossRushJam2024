extends Area2D

var speed = 400
@export var damage = 5

var mousePos
var mousePosGot = false

var travelled_distance = 0
var RANGE = 1000

func _physics_process(delta):
	if mousePosGot == false:
		mousePos = get_local_mouse_position()
		look_at(get_global_mouse_position())
		mousePosGot = true
	position += mousePos.normalized() * speed * delta
	travelled_distance += speed * delta
	if (travelled_distance > RANGE):
		queue_free()
	
func getDamage():
	queue_free()
	return damage
