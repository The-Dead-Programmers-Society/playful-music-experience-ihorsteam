extends Panel

@onready var ihors_scene = $"../IhorsScene"
@onready var alex_scene = $"../AlexScene"



func _on_jaw_harp_toggled(toggled_on):
	ihors_scene.visible = toggled_on
	pass # Replace with function body.


func _on_hand_drum_toggled(toggled_on):
	alex_scene.visible = toggled_on
	pass # Replace with function body.
