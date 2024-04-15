extends Panel

var effect
var recording

func _ready():
	var index = AudioServer.get_bus_index("Recorder")
	effect = AudioServer.get_bus_effect(index, 0)
	
func _on_record_pressed():
	if effect.is_recording_active():
		recording = effect.get_recording()
		effect.set_recording_active(false)
		$Record.text = "Record"
	
	else:
		effect.set_recording_active(true)
		$Record.text = "Stop"
		
	pass # Replace with function body.


func _on_play_pressed():
	$"../Record".stream = recording
	$"../Record".play()
	recording = null
	pass # Replace with function body.





	



	
