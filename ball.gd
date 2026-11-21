extends AnimatedSprite2D

func _ready() -> void:
	hide()
	%ColorRect.hide()
	%ColorRect2.hide()
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument: String) -> void:
	if argument == "show_ball":
		play('default')
		show()
		%ColorRect.show()
		%ColorRect2.show()
