extends Area2D

@export var speed : int
@export var damage : int
@export var range : int
@export var targetPlayer : bool = false
var playerTargeted = false
var directionAttained = false
var travelled_distance = 0

func _ready():
	add_to_group("boss_projectiles")

func _physics_process(delta):
	# Get direction of movement
	if targetPlayer and playerTargeted == false:
		position += get_tree().get_node_in_group("Player").position * speed * delta
		playerTargeted = true
	else:
		# Type of movement
		if directionAttained == false:
			var random_direction = Vector2(randi()%4,randi()%4)
			position += random_direction * speed * delta
			directionAttained = true
			
	travelled_distance += speed * delta
	if (travelled_distance > range):
		queue_free()
	
func getDamage():
	queue_free()
	return damage

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.takeDamage(damage)
