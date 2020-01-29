# Goal.gd

extends Area2D


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	
	
	for body in bodies:
		if body.name == "Player":
			SceneManager.open("Levels")
			
			print("Wohooo! Player won!")
