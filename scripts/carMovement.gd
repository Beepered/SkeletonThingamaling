extends Node2D

#@onready var sprite : Sprite2D = $Sprite2D # Reference to the sprite node
var speed : float = 300  # Adjust speed as needed

func _process(delta: float) -> void:
	# Move the car to the right
	position.x += speed * delta

	# Check if the car is off-screen
	if position.x > get_viewport_rect().size.x:
		queue_free()  # Remove the car from the scene

# Function to set the car sprite texture
func set_sprite_texture(texture: Texture2D) -> void:
	var sprite : Sprite2D = $Sprite2D
	sprite.texture = texture
