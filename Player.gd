extends CharacterBody2D

const GRAVITY = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	if Input.is_action_pressed("ui_right")
		velocity.x += 
	
	move_and_collide(velocity * delta)
	
