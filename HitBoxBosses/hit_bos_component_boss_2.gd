extends Area2D


class_name HitboxComponentBoss2

@export var damage: int =1


func _ready() -> void:
	area_entered.connect(hit)


func hit(area):
	if area is HealthComponent:
		area.takeDamage(damage)
