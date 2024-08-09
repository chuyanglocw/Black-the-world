extends Node2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var left: RayCast2D = $left
@onready var right: RayCast2D = $right
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var speed = 30

func _ready() -> void:
	animation_player.play("float")
	
func _physics_process(delta: float) -> void:
	
	if left.is_colliding():
		position.x -= speed*delta
		sprite_2d.flip_h = false
	elif right.is_colliding():
		position.x += speed*delta
		sprite_2d.flip_h = true
