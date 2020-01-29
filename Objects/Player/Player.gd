# Player.gd

extends KinematicBody2D

const UP = Vector2(0, -1)
const ACCELERATION = 15
const MAX_SPEED = 220
const JUMP_SPEED = 350
const GRAVITY = 15
const SLOWDOWN_GROUND = 0.2
const SLOWDOWN_AIR = 0.02


var motion = Vector2()

var look_direction = 180
var has_landed = false

func _physics_process(delta):
	
	# Gravitation
	motion.y += GRAVITY
	var friction = false
	
	
	# Rörelse
	if Input.is_action_pressed("player_right"):
		motion.x += ACCELERATION
		if motion.x > MAX_SPEED:
			motion.x = MAX_SPEED
		
		$Sprite.flip_h = false
		#$Sprite.play("Run")
		
	elif Input.is_action_pressed("player_left"):
		motion.x -= ACCELERATION
		if motion.x < -MAX_SPEED:
			motion.x = -MAX_SPEED
		
		$Sprite.flip_h = true
		#$Sprite.play("Run")
		
	else:
		friction = true

		#$Sprite.play("Idle")
		
              

	# Hoppa och gravitation
	if is_on_floor():
		if Input.is_action_pressed("player_jump"):
			motion.y = -JUMP_SPEED
			has_landed = false
			$Sounds/Jump.play()
		else:
			if not has_landed: 
				$Sounds/Land.play()
				has_landed = true
			pass
			
		if friction:
			motion.x = lerp(motion.x, 0, SLOWDOWN_GROUND)
			 
	else:
		#if motion.y < 0:	
			#$Sprite.play("Jump")
		#else:
			#$Sprite.play("Fall")
		
		if friction:
			motion.x = lerp(motion.x, 0, SLOWDOWN_AIR)




	# Flytta gubben
	motion = move_and_slide(motion, UP)
	
	
	# Kolla vad motion är
	#print(motion)
	
	pass








func _input(event):
	if event.is_action_pressed("back"):
		SceneManager.open("Levels")
		
	if event.is_action_pressed("restart"):
		#script.change = 1

		pass