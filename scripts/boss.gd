extends CharacterBody2D
@onready var player_health: Label = $"../hud/player_health"
@onready var boss_health: Label = $"../hud/boss_health"


func damage(val):
	player_health.text = str(int(player_health.text) - val)

func hit(val):
	boss_health.text = str(int(boss_health.text) - val)
