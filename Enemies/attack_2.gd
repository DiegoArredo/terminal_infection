extends State


func enter():
	super.enter()
	animacionPlayer.play("attack_2")

func transition():
	if owner.direction.length()>30:
		get_parent().change_state("walk")
