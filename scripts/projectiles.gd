extends Node2D

const PROJECTILE: PackedScene = preload("uid://budxar11doehq")

@export var fire_interval: float = 2

@onready var _markers: Array[Marker2D] = [$top, $mid, $bottom]

var active: bool = false
var _timer: float = 0.0

func _ready() -> void:
	randomize()

func _process(delta: float) -> void:
	if not active:
		return

	_timer -= delta
	if _timer <= 0.0:
		_spawn_from_random_marker()
		_timer = fire_interval

func start_loop() -> void:
	active = true
	_timer = 0.0 # Fires right away when defend is pressed

func stop_loop() -> void:
	active = false

func _spawn_from_random_marker() -> void:
	var idx := randi_range(0, _markers.size() - 1)
	var marker: Marker2D = _markers[idx]
	var projectile := PROJECTILE.instantiate()
	var spawn_pos := marker.global_position

	get_tree().current_scene.add_child(projectile)
	projectile.global_position = spawn_pos
	projectile.direction = Vector2.LEFT
