extends Node2D

@export var direction = Vector2.ZERO
@export var speed : float = 100

func _physics_process(delta: float) -> void:
	global_position += direction * speed * delta


func _on_damage_component_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	queue_free()
