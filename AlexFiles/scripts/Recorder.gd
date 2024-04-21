extends Panel
@onready var play = $Play
@onready var start = $Start
var isRecording: bool = false
var isPlaying: bool = false
var recording = []
var current_note_in_recording = 0

@onready var bpm:float  = 100:
	get:
		return bpm
	set(value):
		bps = 60/value
		bpm = value
		
@onready var bps:float  = 60/bpm
var time:float  = 0.0

func _process(delta):
	if(isPlaying):
		time +=delta
		if time >= bps:
			time -=bps
			recording[current_note_in_recording].audio.play()
			current_note_in_recording += 1
		if(current_note_in_recording>recording.size() - 1):
			current_note_in_recording = 0
			


func _on_start_toggled(toggled_on):
	
	if(isPlaying):
		start.button_pressed = false
		return
	isRecording = toggled_on
	if(isRecording):
		start.text = "Recording..."
		recording.clear()
	else:
		start.text = "Start Recording"
		
	pass # Replace with function body.



func _on_play_toggled(toggled_on):
	isPlaying = toggled_on
	if(isPlaying):
		play.text = "Playing"
	else:
		play.text = "Play"
	pass # Replace with function body.


func _on_v_slider_value_changed(value):
	bpm = value
	pass # Replace with function body.
