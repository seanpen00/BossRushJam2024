extends Sprite2D

@onready var BoltSound = $BoltSound

func _ready():
		%AnimationPlayer.play("Bolt_loop")
		BoltSound.play()

