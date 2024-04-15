extends Control

@onready var bpm:float  = 60:
	get:
		return bpm
	set(value):
		bps = 60/value
		bpm = value
		
@onready var bps:float  = 60/bpm
var time:float  = 0.0
@onready var main_sound = $"../Play/MainSound"
var repeat:bool  = false

func _process(delta):
	if(repeat):
		time +=delta
	
		if time >= bps:
			time -=bps
			main_sound.play()




func _on_toggled(toggled_on):
	repeat = toggled_on
	pass # Replace with function body.


func _on_v_slider_value_changed(value):
	bpm = value
	pass # Replace with function body.
