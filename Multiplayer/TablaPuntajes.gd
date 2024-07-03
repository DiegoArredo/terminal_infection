extends GridContainer

func limpiar():
	for i in self.get_children(): i.queue_free()
