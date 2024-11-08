class_name Projectile
extends Node2D

@export var direction = Vector2.ZERO
@export var speed : float = 500
var spawnPosition = Vector2.ZERO

func _ready() -> void:
	global_position += spawnPosition

func _physics_process(delta: float) -> void:
	global_position += direction * speed * delta
	$AnimatedSprite2D.rotation = direction.angle()


func _on_damage_component_damage_dealt() -> void:
	queue_free()


func _on_damage_component_body_entered(body: Node2D) -> void:
	queue_free()
