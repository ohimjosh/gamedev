extends CharacterBody2D
@onready var sprite_2d = $Sprite2D


const speed = 400
var current_dir = "none"

func _physics_process(delta):
	player_movement(delta)
	
func player_movement(delta):
	
	#right
	if Input.is_action_pressed("right"):
		current_dir = "right"
		player_animation(1)
		velocity.x = speed
		velocity.y = 0
		
		
	
	
	#left
	elif Input.is_action_pressed("left"):
		current_dir = "left"
		player_animation(1)
		velocity.x = -speed
		velocity.y = 0
		
		
		
	
	
	#down
	elif Input.is_action_pressed("down"):
		current_dir = "down"
		player_animation(1)
		velocity.x = 0
		velocity.y = speed
	
	#up
	elif Input.is_action_pressed("up"):
		current_dir = "up"
		player_animation(1)
		velocity.x = 0
		velocity.y = -speed
	
	else: 
		player_animation(0)
		velocity.x = 0
		velocity.y = 0
		

	move_and_slide()
	
func player_animation(movement):
	var dir = current_dir
	if dir == "right":
		sprite_2d.flip_h = false
		if movement == 1:
			sprite_2d.animation = "run_side"
		elif movement == 0:
			sprite_2d.animation = "idle_side"
			
	if dir == "left":
		sprite_2d.flip_h = true
		if movement == 1:
			sprite_2d.animation = "run_side"
		elif movement == 0:
			sprite_2d.animation = "idle_side"
			
			
	if dir == "up":
		sprite_2d.flip_h = false
		if movement == 1:
			sprite_2d.animation = "run_back"
		elif movement == 0:
			sprite_2d.animation = "idle_back"
	
	if dir == "down":
		sprite_2d.flip_h = true
		if movement == 1:
			sprite_2d.animation = "run_front"
		elif movement == 0:
			sprite_2d.animation = "idle_front"
	
	
	
	
	
