extends CharacterBody2D

@export var Bullet : PackedScene

func _ready():
	pass

func _physics_process(delta):
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		shoot()

func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $ProjectileOrigin.global_transform

	
