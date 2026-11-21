extends CharacterBody2D
@onready var boss_health: Label = $"../hud/boss_health"


func damage():
	boss_health.text = str(int(boss_health.text) - 10)
