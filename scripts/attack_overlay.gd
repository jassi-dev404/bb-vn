extends Node2D

@onready var high: Area2D = $high
@onready var mid: Area2D = $mid
@onready var low: Area2D = $low
@onready var boss_damage_anim: AnimatedSprite2D = $"../boss_damage_anim"


func _ready() -> void:
	add_to_group("attack_zones")

func check_stop(bar: Node2D) -> void:
	if high.overlaps_body(bar):
		get_tree().call_group("boss", "hit", 25)
		boss_damage_anim.show()
		boss_damage_anim.play("default")
		await boss_damage_anim.animation_finished
		boss_damage_anim.hide()
	elif mid.overlaps_body(bar):
		get_tree().call_group("boss", "hit", 13)
		boss_damage_anim.show()
		boss_damage_anim.play("default")
		await boss_damage_anim.animation_finished
		boss_damage_anim.hide()
	elif low.overlaps_body(bar):
		get_tree().call_group("boss", "hit", 6)
		boss_damage_anim.show()
		boss_damage_anim.play("default")
		await boss_damage_anim.animation_finished
		boss_damage_anim.hide()
