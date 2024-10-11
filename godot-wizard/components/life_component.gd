extends Area2D

@export var lifeAmount = 10;

signal dead()

func _on_area_entered(area: DamageComponent) -> void:
	lifeAmount -= area.damageAmount
	if(lifeAmount <= 0):
		emit_signal("dead")
