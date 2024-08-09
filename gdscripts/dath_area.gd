extends Area2D

const END = preload("res://scenes/end.tscn")

func _on_body_entered(body: Node2D) -> void:
	var end = END.instantiate()
	get_tree().current_scene.add_child(end)
