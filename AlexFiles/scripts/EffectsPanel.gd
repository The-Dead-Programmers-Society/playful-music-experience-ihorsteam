extends Panel

@onready var busIndex = AudioServer.get_bus_index("AlexBus")

func _on_distortion_toggled(toggled_on):
	AudioServer.set_bus_effect_enabled(busIndex,2,toggled_on)
	pass # Replace with function body.


func _on_reverb_toggled(toggled_on):
	AudioServer.set_bus_effect_enabled(busIndex,1,toggled_on)
	pass # Replace with function body.


func _on_delay_toggled(toggled_on):
	AudioServer.set_bus_effect_enabled(busIndex,0,toggled_on)
	pass # Replace with function body.


func _on_chorus_toggled(toggled_on):
	AudioServer.set_bus_effect_enabled(busIndex,3,toggled_on)
	pass # Replace with function body.


func _on_pitch_toggled(toggled_on):
	AudioServer.set_bus_effect_enabled(busIndex,4,toggled_on)
	pass # Replace with function body.
