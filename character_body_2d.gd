extends CharacterBody2D
@onready var ball: AnimatedSprite2D = $ball


func _physics_process(delta: float) -> void:
	velocity.y += 30
	if is_on_floor():
		velocity.y = -1000
		ball.play("default")
		
	move_and_slide()
