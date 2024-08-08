extends CharacterBody2D

var speed = 300.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var torch: PointLight2D = $torch

var toward = 1
var look_to = 1

@export var flip_h = false
var torch_position = Vector2.ZERO

func _ready() -> void:
	torch_position = torch.position

func _physics_process(delta: float) -> void:
	toward = 0
	toward = Input.get_axis("ui_left","ui_right")
	velocity.x = speed * toward
	animation_change()
	
	move_and_slide()

#改变动画
func animation_change():
	#动画朝向
	if Input.is_action_pressed("ui_left"):
		look_to = -1
		flip_h = true
	elif Input.is_action_pressed("ui_right"):
		look_to = 1
		flip_h = false
	#动画播放
	if toward > 0:
		animated_sprite_2d.play("walk_right")
	elif toward < 0:
		animated_sprite_2d.play("walk_left")
	else:
		if look_to > 0:
			animated_sprite_2d.play("default_right")
		else:
			animated_sprite_2d.play("default_left")
	if flip_h:
		torch.position.x = -torch_position.x
	else:
		torch.position.x = torch_position.x
