extends Node2D

var quotes = [
	"I think... I miss my wife.",
	"You look like the 4th of July,\n makes me want a hot dog real bad.",
	"Throw me,\n BOB THROW ME!",
	"Though bleached by sun and\n wind, my presence tells of\n cycles unending, and in solitude,\n I touch the infinite.",
	"In this sandy symphony of\n stillness, I chew the cud of\n my thoughts",
	"To live is to suffer, to\n survive is to find some\n meaning in the suffering.",
	"I wonder what\n chicken tastes like.",
	"Patience is bitter, but\n its fruit is sweet.",
	"Yeeeehaw.\n I've always wanted to say that."
]

var current_quote_index = 0
@onready var textBox = $TextBox
@onready var textBubbles = $"Pre-textBubbles"
@onready var text = $TextBox/Label

func _ready() -> void:
	show_next_quote()

func show_next_quote() -> void:
	text.text = quotes[current_quote_index]
	textBox.visible = true
	text.visible = true
	textBubbles.visible = true
	$Display_timer.start()


func _on_display_timer_timeout() -> void:
	textBox.visible = false
	text.visible = false
	textBubbles.visible = false
	# Randomized waiting time between 5 and 20 seconds
	var wait_time = randi() % 15 + 5
	$Wait_timer.wait_time = wait_time
	$Wait_timer.start()


func _on_wait_timer_timeout() -> void:
	current_quote_index = randi() % quotes.size()
	show_next_quote()
