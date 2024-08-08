extends AnimatedSprite2D


var toward = Vector2.RIGHT
var speed = 300.0

func  _physics_process(delta: float) -> void:
	position += speed * toward * delta
