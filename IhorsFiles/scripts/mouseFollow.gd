extends Sprite2D

@onready var initialPos = position
@export var speed: = 1
 
func _process(delta):
	position = initialPos+ get_global_mouse_position() * 0.01 * speed
