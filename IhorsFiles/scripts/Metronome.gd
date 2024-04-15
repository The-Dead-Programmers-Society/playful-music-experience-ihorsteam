extends Panel

@export var bpm:float  = 60
var bps:float  = 60/bpm
var time:float  = 0.0
@onready var main_sound = $"../Play/MainSound"
var repeat:bool  = false

func _process(delta):
	if(repeat):
		time +=delta
	
		if time >= bps:
			time -=bps
			main_sound.play()


func _on_check_box_toggled(toggled_on):
	repeat = toggled_on
	pass # Replace with function body.
