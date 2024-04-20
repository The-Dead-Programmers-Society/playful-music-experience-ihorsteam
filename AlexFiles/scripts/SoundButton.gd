extends Button

@onready var audio = $AudioStreamPlayer2D
@export var current_note := 0

func _ready():
	pitch_sound(current_note)

func _on_pressed():
	audio.play()
	pass # Replace with function body.

func pitch_sound(note: float):
	var pitch = pow(2, note/12.0)
	audio.pitch_scale = pitch
