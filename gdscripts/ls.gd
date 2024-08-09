extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var left: RayCast2D = $left
@onready var right: RayCast2D = $right
var tween : Tween
var toward = 1

func _physics_process(delta: float) -> void:
	if left.is_colliding():
		toward = 1
		animated_sprite_2d.flip_h = false
		animation_player.play("jump")
		
	if right.is_colliding():
		toward = -1
		animated_sprite_2d.flip_h = true
		animation_player.play("jump")

func jump():
	tween = get_tree().create_tween()
	tween.tween_callback(func() : animated_sprite_2d.play("惊吓")).set_delay(0.2)
	tween.tween_callback(func() : animated_sprite_2d.play("jump")).set_delay(0.2)
	for i in range(50):
		tween.tween_callback(func() : position.x +=toward)
		tween.tween_callback(func() : position.y -=1).set_delay(0.01)
	for i in range(50):
		tween.tween_callback(func() : position.x +=toward)
		tween.tween_callback(func() : position.y +=1).set_delay(0.01)
	tween.tween_callback(func() : animated_sprite_2d.play("default"))
	tween.tween_callback(func() :tween.kill())
