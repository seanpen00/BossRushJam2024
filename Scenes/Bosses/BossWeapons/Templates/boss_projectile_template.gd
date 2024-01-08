extends Area2D

@export var speed : int
@export var damage : int
@export var range : int
## This is for making some projectiles face the player while some don't face the player.
@export var facePlayer : bool = true
@export var targetPlayer : bool = false
var playerTargeted = false
var directionAttained = false
var travelled_distance = 0
var direction : Vector2

func _ready():
	add_to_group("boss_projectiles")

func _physics_process(delta):
	# Get direction of movement
	if targetPlayer and playerTargeted == false and directionAttained == false:
		var player = get_tree().current_scene.get_node("Player")
		if (facePlayer):
			look_at(player.position)
		direction = player.get_position().normalized()
		playerTargeted = true
		directionAttained = true
	else:
		# Type of movement
		if directionAttained == false:
			var random_direction = Vector2(randi()%4,randi()%4)
			direction = random_direction
			directionAttained = true
	position += direction * speed * delta
			
	travelled_distance += speed * delta
	if (travelled_distance > range):
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
		body.takeDamage(damage)
		
