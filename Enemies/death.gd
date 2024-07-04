extends State

func enter():
	super.enter()
	animacionPlayer.play("death")
	await animacionPlayer.animation_finished
