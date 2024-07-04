extends Node

#variables multiplayer
var nombre = ""

#variables juego
var tiempo_vivo = 0
var experiencia=0
var puntaje= 0

#variables personaje
var multiplicador=1
var level=0
var life=100
var daño=1*multiplicador
var velocidad = 100

#variables arma 1
var speed=200
var rango=100

#variables habilidad magia
var magiaCantidad=0
var magiaBase=1
var magiaVelocidad=1.5
var magiaNivel = 1

#variables enemigo 1
var life_enemy1=25
var damage_enemy1=3
var level_enemy1=1

#variables enemigo 2
var life_enemy2=50
var damage_enemy2=3
var level_enemy2=1

#variables enemigo 3
var life_enemy3=75
var damage_enemy3=3
var level_enemy3=1

#variables enemigo 4
var life_enemy4=100
var damage_enemy4=3
var level_enemy4=1

#variables boos 1
var life_boos1=500
var damage_boos1=3
var level_boos1=1


func reset():
	#variables multiplayer
	nombre = ""

	#variabales juego
	experiencia=0
	puntaje= 0

	#variables personaje
	multiplicador=1
	level=0
	life=100
	daño=1*multiplicador

	#variables arma 1
	speed=200
	rango=100

	#variables habilidad magia
	magiaCantidad=0
	magiaBase=1
	magiaVelocidad=1.5
	magiaNivel = 1

	#variables enemigo 1
	life_enemy1=25
	damage_enemy1=3
	level_enemy1=1

	#variables enemigo 2
	life_enemy2=50
	damage_enemy2=3
	level_enemy2=1

	#variables enemigo 3
	life_enemy3=75
	damage_enemy3=3
	level_enemy3=1

	#variables enemigo 4
	life_enemy4=100
	damage_enemy4=3
	level_enemy4=1

	#variables boos 1
	life_boos1=500
	damage_boos1=3
	level_boos1=1



