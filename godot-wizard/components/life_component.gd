extends Area2D

@export var lifeAmount = 10;

signal dead()

func _on_area_entered(area: DamageComponent) -> void:
	lifeAmount -= area.damageAmount
	area.emit_signal("damageDealt")
	if(lifeAmount <= 0):
		emit_signal("dead")
