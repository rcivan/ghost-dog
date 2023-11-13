extends CharacterBody2D


const SPEED_CUTOFF = 600.0
const JUMP_VELOCITY = -800.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_air_sliding = false
var cancel_cooldown = false
var is_sliding =  false

func _physics_process(delta):
	
	var direction = Input.get_axis("left", "right")
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY 
		
	#Handle Slide Jump
	if Input.is_action_just_pressed("jump") and is_air_sliding and not cancel_cooldown:
		velocity.y += -400 
		velocity.x += 100 * direction
		is_air_sliding = false
		cancel_cooldown = true
		
	# toggles slide and jump when grounded
	if is_on_floor() and cancel_cooldown:
		cancel_cooldown = false
	if is_air_sliding and is_on_floor():
		is_air_sliding = false
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if direction and velocity.x < SPEED_CUTOFF and velocity.x > -SPEED_CUTOFF:
		velocity.x += 40 * direction
	elif not direction and not is_air_sliding and not is_sliding:
		velocity.x = move_toward(velocity.x, 0, 200)
	elif is_air_sliding or cancel_cooldown:
		velocity.x = move_toward(velocity.x,0,1)
	elif is_sliding:
		velocity.x = move_toward(velocity.x,0,5) 
	
	#Handles Slide
	if Input.is_action_just_pressed("slide") and not is_sliding and not is_air_sliding:
		velocity.x = 1200 * direction
		if not is_on_floor():
			is_air_sliding = true
		elif is_on_floor():
			is_sliding = true
	
	if velocity.x <= 400 and velocity.x >= -400 and is_sliding or Input.is_action_just_pressed("jump") :
		is_sliding = false
	

	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = velocity.x > 0
		$AnimatedSprite2D.play('walk')
	else:
		$AnimatedSprite2D.play('idle')

	move_and_slide()
