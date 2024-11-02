extends Node2D

@export var car_scene : PackedScene  # Assign the Car scene in the Inspector
@export var car_sprites : Array[Texture2D]  # Array to store car textures
var timer : float = 0.0
var spawn_interval : float = 0.0  # Initialize spawn interval
@export var spawnMin : float = 10.0
@export var spawnMax : float = 25.0

func _ready() -> void:
	# Set the initial spawn interval to a random value between spawnMin and spawnMax seconds
	spawn_interval = randf_range(spawnMin, spawnMax)

func _process(delta: float) -> void:
	timer += delta
	if timer >= spawn_interval:
		timer = 0
		spawn_car()
		# Set the next spawn interval to a new random value within the range
		spawn_interval = randf_range(spawnMin, spawnMax)

func spawn_car() -> void:
	var car = car_scene.instantiate()  # Instantiate a new car
	car.position = position  # Set the car position to the spawner's position

	# Pick a random texture from the car_sprites array
	if car_sprites.size() > 0:
		var random_texture = car_sprites[randi() % car_sprites.size()]
		car.set_sprite_texture(random_texture)  # Set the car's sprite texture

	get_parent().add_child(car)
