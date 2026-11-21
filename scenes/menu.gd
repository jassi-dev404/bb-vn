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


func _ready() -> void:
	box.hide()
	ball.hide()
	label.hide()
	cooldown.hide()
	cooldown_counter.hide()
	label_2.hide()


func _on_attack_pressed() -> void:
	pass


func _on_defend_pressed() -> void:
	box.show()
	ball.show()
	label.show()
	label_2.show()
	projectiles_spawner.start_loop()
