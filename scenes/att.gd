extends CharacterBody2D

signal attack_finished

@onready var attack_overlay: Node2D = $"../attack_overlay"
@onready var box: StaticBody2D = $"../Node2D/bg/box"
@onready var boss: CharacterBody2D = $"../boss"

var start_x: float = 0.0
var direction: float = 1.0

func _ready() -> void:
	start_x = global_position.x
	add_collision_exception_with(box)
	add_collision_exception_with(boss)

func _physics_process(_delta: float) -> void:
	if not visible:
		velocity.x = 0
		move_and_slide()
		return
	if global_position.x >= 480.0:
		direction = -1.0
	elif global_position.x <= start_x:
		direction = 1.0
	velocity.x = 200 * direction
	move_and_slide()
	if Input.is_action_just_pressed("jump"):
		attack_overlay.check_stop(self)
		hide()
		attack_overlay.hide()
		global_position.x = start_x
		direction = 1.0
		velocity.x = 0
		attack_finished.emit()
