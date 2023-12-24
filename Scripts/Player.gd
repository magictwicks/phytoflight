extends CharacterBody2D

const GRAVITY = 75
var grav_mult = 1.0
const SPEED = 40
const JUMP = 75
const FLYBOOST = 15

# Called when the node enters the scene tree for the first time.
func _ready(): 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if is_on_floor():
		grav_mult = 1
	if not is_on_floor():
		velocity.y += GRAVITY * delta * grav_mult
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED 
	else:
		velocity.x = lerp(velocity.x, 0.0, .2)
	
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = -JUMP
		elif velocity.y > 20:
			velocity.y -= FLYBOOST
			grav_mult += .05
	
	move_and_slide()

