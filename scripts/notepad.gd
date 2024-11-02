extends Node2D

@onready var icon = $".".texture

var shown : bool = false
var mouseOver : bool = false

func _ready() -> void:
	var newYPos = get_viewport_rect().size.y / 2
	var size = icon.get_size() * (transform.get_scale() / 2) # size of image * scale
	var howMuchToReveal = get_viewport_rect().size.x / 20 # how much to the left to reveal
	var newXPos = get_viewport_rect().size.x + size.x - howMuchToReveal
	position = Vector2(newXPos, newYPos)

func _input(event):
	if(event is InputEventMouseButton && event.pressed && mouseOver):
		shown = !shown;
		if (shown):
			var newPos = get_viewport_rect().size / 2
			position.x = newPos.x
		else:
			var size = icon.get_size() * (transform.get_scale() / 2)
			var howMuchToReveal = get_viewport_rect().size.x / 20
			var newXPos = get_viewport_rect().size.x + size.x - howMuchToReveal
			position.x = newXPos

func _on_area_2d_mouse_shape_entered(shape_idx: int) -> void:
	mouseOver = true

func _on_area_2d_mouse_shape_exited(shape_idx: int) -> void:
	mouseOver = false
