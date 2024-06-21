extends Area2D

var level =1
var hp=999
var speed=100.0
var damage=5
var atack=1

var ultimo_movimiento = Vector2.ZERO
var angulo= Vector2.ZERO
var angulo2= Vector2.ZERO
var angulo3= Vector2.ZERO

@onready var Player= get_tree().get_first_node_in_group("player_1")

func _ready():
	match level:
		1:
			hp=999
			speed=100.0
			damage=5
	var movimiento=Vector2.ZERO
	var movimiento2=Vector2.ZERO
	
	match  ultimo_movimiento:
		Vector2.UP,Vector2.DOWN:
			movimiento = global_position + Vector2(randf_range(-1,-0.25),ultimo_movimiento.y)*500
			movimiento2 = global_position + Vector2(randf_range(0.25,1),ultimo_movimiento.y)*500
		Vector2.RIGHT,Vector2.LEFT:
			movimiento = global_position + Vector2(ultimo_movimiento.x,randf_range(-1,-0.25))*500
			movimiento2 = global_position + Vector2(ultimo_movimiento.x,randf_range(0.25,1))*500
		Vector2(1,1),Vector2(-1,-1),Vector2(1,-1),Vector2(-1,1):
			movimiento = global_position + Vector2(ultimo_movimiento.x,ultimo_movimiento.y* randf_range(0,0.75))*500
			movimiento2 = global_position + Vector2(ultimo_movimiento.x*randf_range(0,0.75),ultimo_movimiento.y)*500
	angulo2 = global_position.direction_to(movimiento)
	angulo3=global_position.direction_to(movimiento2)
	
	var gemelo=create_tween()
	var set_angle=randi_range(0,1)
	if set_angle==1:
		angulo=angulo2
		gemelo.tween_property(self,"angulo",angulo3,2)
		gemelo.tween_property(self,"angulo",angulo2,2)
		gemelo.tween_property(self,"angulo",angulo3,2)
		gemelo.tween_property(self,"angulo",angulo2,2)
		gemelo.tween_property(self,"angulo",angulo3,2)
		gemelo.tween_property(self,"angulo",angulo2,2)
	else:
		angulo=angulo3
		gemelo.tween_property(self,"angulo",angulo2,2)
		gemelo.tween_property(self,"angulo",angulo3,2)
		gemelo.tween_property(self,"angulo",angulo2,2)
		gemelo.tween_property(self,"angulo",angulo3,2)
		gemelo.tween_property(self,"angulo",angulo2,2)
		gemelo.tween_property(self,"angulo",angulo3,2)
	gemelo.play()
func _physics_process(delta):
	position+=angulo*speed*delta

func _on_timer_timeout():
	queue_free()

func _on_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage()
