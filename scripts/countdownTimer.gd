extends Label

var hour : int = 1
var minute : int = 0
var second : int = 0

func _ready() -> void:
	var timeText = "hr:min:sec"
	timeText = "%02d" % hour + ":"
	timeText += "%02d" % minute + ":"
	timeText += "%02d" % second
	set_text(timeText)

func _on_timer_timeout() -> void:
	second -= 1
	if(second <= 0 && (minute > 0 || hour > 0)):
		minute -= 1
		second = 59
	if(minute <= 0 && hour > 0):
		hour -= 1
		minute = 59
	if(hour <= 0 && minute <= 0 && second <= 0): # end game
		get_tree().quit()
	var timeText = "hr:min:sec"
	timeText = "%02d" % hour + ":"
	timeText += "%02d" % minute + ":"
	timeText += "%02d" % second
	set_text(timeText)
