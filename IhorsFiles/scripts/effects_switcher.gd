extends Panel

@onready var index = AudioServer.get_bus_index("Recorder")

func _on_distortion_toggled(toggled_on):
	AudioServer.set_bus_effect_enabled(index,2,toggled_on)
	pass # Replace with function body.


func _on_chorus_toggled(toggled_on):
	AudioServer.set_bus_effect_enabled(index,4,toggled_on)
	pass # Replace with function body.


func _on_reverb_toggled(toggled_on):
	AudioServer.set_bus_effect_enabled(index,1,toggled_on)
	pass # Replace with function body.


func _on_delay_toggled(toggled_on):
	AudioServer.set_bus_effect_enabled(index,3,toggled_on)
	pass # Replace with function body.
