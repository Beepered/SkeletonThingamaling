extends RigidBody2D


var speed = 200  # Adjust speed as needed

func _process(delta):
	# Move the car to the right
	position.x += speed * delta

	# Check if the car is off-screen (Brendan: a little farther because it deletes when the car is still half-way on screen)
	if position.x > get_viewport_rect().size.x + 200:
		queue_free()  # Remove the car from the scene
