# Arrow.gd

extends KinematicBody2D

const UP = Vector2(0, -1)
const SHOOT_SPEED = 15
const GRAVITY = 15
#const GRAVITY = -10


var motion = Vector2()


func _physics_process(delta):
	
	# Gravity
	motion.y += GRAVITY

	# Move
	motion = move_and_slide(motion, UP)
	
	
	
	rotate(1)
	
	
	# Check
	#print(motion)
	
	pass



