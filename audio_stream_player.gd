extends AudioStreamPlayer

func _ready() -> void:
	stream = preload("res://assets/main.wav")
	play()
