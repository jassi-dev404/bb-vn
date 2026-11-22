extends Control

@onready var projectiles_spawner := get_node("../projectiles") 
@onready var attack: Button = $attack
@onready var defend: Button = $defend
@onready var box: StaticBody2D = $"../Node2D/bg/box"
@onready var ball: CharacterBody2D = $"../ball"
@onready var label: Label = $"../hud/Label"
@onready var cooldown: Label = $"../hud/cooldown"
@onready var cooldown_counter: Label = $"../hud/cooldown_counter"
@onready var label_2: Label = $"../hud/Label2"
@onready var attack_overlay: Node2D = $"../attack_overlay"
@onready var att: CharacterBody2D = $"../att"
@onready var cooldown_timer: Timer = $"../hud/cooldown_timer"
@onready var cooldown_end: Timer = $"../hud/cooldown_end"

var ball_start: Vector2

func _ready() -> void:
	box.hide()
	ball.hide()
	label.hide()
	cooldown.hide()
	cooldown_counter.hide()
	label_2.hide()
	ball_start = ball.global_position
	att.attack_finished.connect(_on_attack_finished)

func _process(delta: float) -> void:
	if box.visible == true:
		hide()
	else :
		show()
		

func _on_attack_pressed() -> void:
	attack.hide()
	defend.hide()
	$ColorRect.hide()
	attack_overlay.show()
	att.show()

func _on_attack_finished() -> void:
	start_box()

func _on_defend_pressed() -> void:
	start_box()

func start_box() -> void:
	box.show()
	ball.show()
	label.show()
	label_2.show()
	projectiles_spawner.start_loop()
	get_tree().create_timer(7.0).timeout.connect(_on_box_timer_timeout)

func _on_box_timer_timeout() -> void:
	projectiles_spawner.stop_loop()
	get_tree().call_group("projectiles", "queue_free")
	box.hide()
	ball.hide()
	label.hide()
	cooldown.hide()
	cooldown_counter.hide()
	label_2.hide()
	cooldown_timer.stop()
	cooldown_end.stop()
	cooldown_counter.text = "10"
	label_2.text = "3"
	ball.global_position = ball_start
	ball.velocity = Vector2.ZERO
	ball.set("has_jumped", false)
	ball.set("jump2", false)
	attack.show()
	defend.show()
	$ColorRect.show()
	show()
