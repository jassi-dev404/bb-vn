extends Button

@export var intensity: float = 0.1
@export var duration: float = 0.2
@export var cr: int = 30

func _ready() -> void:
	for state in ["normal", "hover", "pressed", "focus", "disabled"]:
		var style = get_theme_stylebox(state).duplicate()
		if style is StyleBoxFlat:
			style.corner_radius_top_left = cr
			style.corner_radius_top_right = cr
			style.corner_radius_bottom_left = cr
			style.corner_radius_bottom_right = cr
			add_theme_stylebox_override(state, style)

func _process(delta: float) -> void:
	pivot_offset = size / 2
	if is_hovered():
		scale = scale.lerp(Vector2.ONE + Vector2.ONE * intensity, 1.0 - exp(-12.0 * delta))
	else:
		scale = scale.lerp(Vector2.ONE, duration)
		
func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")
	pass 
