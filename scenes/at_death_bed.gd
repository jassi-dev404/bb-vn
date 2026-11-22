extends Node2D

func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.Styles.change_style("un_cool")
	Dialogic.start("story")

func _on_dialogic_signal(argument: String) -> void:
	if argument == "start_combat":
		get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_timeline_ended() -> void:
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	get_tree().change_scene_to_file("res://scenes/main.tscn")
