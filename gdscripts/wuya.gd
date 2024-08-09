extends AnimatedSprite2D


var toward = 1
var speed_max = 100
var speed = 100

@export var aim : Node2D
var fly_toward = 1

func _ready() -> void:
	if aim == null:
		aim = self

func  _physics_process(delta: float) -> void:
	paihuai(delta)
	

func paihuai(delta):
	if position.x < aim.position.x:
		toward = -1
	else:
		toward = 1
	if fly_toward == toward:
		if speed > 0:
			speed -= 1
		else:
			speed = speed_max
			fly_toward = -fly_toward
	else:
		speed = speed_max
	if fly_toward >0:
		flip_h = false
	else:
		flip_h = true
	position.x += speed * fly_toward * delta
