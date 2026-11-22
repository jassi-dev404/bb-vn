extends Node2D

@onready var boss_health: Label = $hud/boss_health
@onready var survive: Label = $survive
@onready var survive_timer: Timer = $survive_timer
@onready var survive_timer_end: Timer = $survive_timer_end
@onready var box: StaticBody2D = $Node2D/bg/box

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if boss_health.text == '0':
		get_tree().change_scene_to_file("res://scenes/retry.tscn")
	if not box.visible:
		survive_timer.start()
	
	if survive.text == '0':
		get_tree().change_scene_to_file("res://scenes/won.tscn")

func _on_survive_timer_timeout() -> void:
	if survive.text != '0':
		survive.text = str(int(survive.text) - 1)

func _on_survive_timer_end_timeout() -> void:
	survive_timer.stop()
