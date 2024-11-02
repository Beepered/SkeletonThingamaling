extends Node2D

@export var car_scene : PackedScene  # Assign the Car scene in the Inspector
var timer : float = 0.0
var spawn_interval : float = 0.0  # Initialize spawn interval

func _ready() -> void:
	# Set the initial spawn interval to a random value between 30 and 60 seconds
	spawn_interval = randf_range(30.0, 60.0)

func _process(delta: float) -> void:
	timer += delta
	if timer >= spawn_interval:
		timer = 0
		spawn_car()
		# Set the next spawn interval to a new random value between 30 and 60 seconds
		spawn_interval = randf_range(30.0, 60.0)

func spawn_car() -> void:
	var car = car_scene.instantiate()  # Use instantiate() instead of instance()
	car.position = Vector2(0, get_viewport_rect().size.y / 2)  # Spawn at the left side, halfway down
	get_parent().add_child(car)
