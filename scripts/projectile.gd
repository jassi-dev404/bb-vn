extends CharacterBody2D

@onready var area_2d: Area2D = $Area2D

@export var speed: float = 100.0
@export var lifetime: float = 3.0

var direction: Vector2 = Vector2.LEFT
var _has_hit: bool = false

func _ready() -> void:
	get_tree().create_timer(lifetime).timeout.connect(queue_free)

func _physics_process(_delta: float) -> void:
	velocity = direction.normalized() * speed
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if _has_hit:
		return

	if body.name == "ball":
		_has_hit = true
		get_tree().call_group("boss", "damage")
		queue_free()
