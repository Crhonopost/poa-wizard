extends Node2D

@export var direction = Vector2.ZERO
@export var speed : float = 1

func _physics_process(delta: float) -> void:
	position += direction * speed * delta
