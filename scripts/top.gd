extends Marker2D

const PROJECTILE: PackedScene = preload("uid://budxar11doehq")

@export var fire_interval: float = 0.2

var _timer: float = 0.0

func _process(delta: float) -> void:
	_timer -= delta
	if _timer <= 0.0:
		_spawn_projectile()
		_timer = fire_interval

func _spawn_projectile() -> void:
	var projectile := PROJECTILE.instantiate()
	var spawn_transform := global_transform

	get_tree().current_scene.add_child(projectile)
	projectile.global_transform = spawn_transform
	projectile.direction = Vector2.LEFT
