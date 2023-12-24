extends Node2D
var platform= preload("res://triple_plat.tscn")
const boxSize = Vector2(16, 304) # Define the size of the box
const minDistance = 32 # Minimum distance between platforms

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_platforms()
	pass # Replace with function body.

func generate_platforms():
	var numberOfPlatforms = randi_range(2, 15)
	for i in range(numberOfPlatforms):
		var platformPosition = Vector2(randi() % int(boxSize.x), randi() % int(boxSize.y)) # Generate random position
		
		# Check if the platform is too close to existing platforms
		while !isValidPosition(platformPosition):
			platformPosition = Vector2(randi() % int(boxSize.x), randi() % int(boxSize.y))
		
		# Create platform instance
		var levelplat = platform.instantiate()
		levelplat.position = platformPosition
		add_child(levelplat)
		
		print(platformPosition)
func isValidPosition(pos):
	# Check if the position is within the box and not too close to other platforms
	for child in get_children():
		if child.position.distance_to(pos) < minDistance:
			return false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



