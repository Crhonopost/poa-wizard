extends Node2D

func _on_collectible_component_collected() -> void:
	queue_free()
