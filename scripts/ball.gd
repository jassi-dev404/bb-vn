extends CharacterBody2D
@onready var jump_counter: Label = $"../hud/Label2"
@onready var cooldown: Label = $"../hud/cooldown"
@onready var cooldown_counter: Label = $"../hud/cooldown_counter"
@onready var cooldown_timer: Timer = $"../hud/cooldown_timer"
@onready var cooldown_end: Timer = $"../hud/cooldown_end"
@onready var anim_player: AnimatedSprite2D = $AnimatedSprite2D

var speed = 50
var has_jumped = false
var jump2 = false
func _ready():
	cooldown.hide()
	cooldown_counter.hide()
	
func _process(delta: float) -> void:
	
	var direction = Input.get_axis("move_left", "move_right")
	
	if Input.is_action_pressed("move_right"):
		velocity.x = direction * speed
	elif Input.is_action_pressed("move_left"):
		velocity.x = direction * speed
	if Input.is_action_just_released("move_right") or Input.is_action_just_released("move_left"):
		velocity.x = 0
	if Input.is_action_just_pressed("jump") and not has_jumped:
		velocity.y += -100
		has_jumped = true
		jump2 = true
		
	if is_on_floor():
		has_jumped = false
	#gravity
	velocity.y += 10
	
	move_and_slide()

		
		
	if jump_counter.text == '0':
		cooldown.show()
		cooldown_counter.show()
		if cooldown_timer.is_stopped():
			cooldown_timer.start()
		if cooldown_end.is_stopped():
			cooldown_end.start()
		has_jumped = true
	if jump2:
		if jump_counter.text != '0':
			jump_counter.text = str(int(jump_counter.text) - 1)
		jump2 = false

#SIGNALS
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "ball":
		velocity.y = -250
		anim_player.play("bounce")
		await anim_player.animation_finished
		anim_player.play("idle")


func _on_cooldown_timer_timeout() -> void:
	if cooldown_counter.text != '0':
		cooldown_counter.text = str(int(cooldown_counter.text) - 1)


func _on_cooldown_end_timeout() -> void:
	has_jumped = false
	cooldown_timer.stop()
	cooldown_counter.text = '10'
	jump_counter.text = '3'
	cooldown_counter.hide()
	cooldown.hide()
