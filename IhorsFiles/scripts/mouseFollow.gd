extends Sprite2D

@onready var initialPos = position

func _process(delta):
	position = initialPos+ get_global_mouse_position() * 0.03
