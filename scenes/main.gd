extends Node2D

@onready var boss_health: Label = $hud/boss_health
@onready var player_health: Label = $hud/player_health
@onready var box: StaticBody2D = $Node2D/bg/box
@onready var boss: CharacterBody2D = $boss
@onready var boss_damage_anim: AnimatedSprite2D = $boss_damage_anim

func _ready() -> void:
	pass
	boss_damage_anim.visible = false
func _process(delta: float) -> void:
	if int(player_health.text) <= 0:
		get_tree().change_scene_to_file("res://scenes/retry.tscn")
		return
	if int(boss_health.text) <= 0:
		get_tree().change_scene_to_file("res://scenes/won.tscn")
		return
	if box.visible == true:
		boss.hide()
	else:
		boss.show()
	
	
