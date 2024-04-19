extends Button
class_name AudioButton

var can_play:bool = false
@export_range(0,12) var current_note:int = 0 
@onready var audio = $AudioStreamPlayer2D

func _ready():
	pitch_sound(current_note)
	
func pitch_sound(note: float):
	var pitch = pow(2, note/12.0)
	audio.pitch_scale = pitch
	


func _on_toggled(toggled_on):
	can_play = toggled_on
	pass # Replace with function body.
