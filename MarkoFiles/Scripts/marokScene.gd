extends Node2D


func _on_button_pressed():
	$dogbark.play()
	pass # Replace with function body.
	

func _on_h_slider_value_changed(value):
	var pitch:AudioEffectPitchShift = AudioServer.get_bus_effect(0,0)
	
	pitch.pitch_scale = $HSlider.value
	pass # Replace with function body.
	
func _process(_delta):
	if Input.is_action_pressed("bark_sound"):
		$dogbark.play()

