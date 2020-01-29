# Worldcomplete.gd

extends Area2D

export(String) var next_world


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	
	
	for body in bodies:
		if body.name == "Player":
			print("Transporting to", next_world)
			SceneManager.open(next_world)
