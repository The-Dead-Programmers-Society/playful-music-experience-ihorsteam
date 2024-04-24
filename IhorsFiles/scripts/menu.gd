extends Panel

@onready var ihors_scene = $"../IhorsScene"
@onready var alex_scene = $"../AlexScene"
@onready var piano = $"../Node2D"
@onready var bass_scene = $"../Bass_Scene"
const MACIEK_SCENE = preload("res://MaciekScene.tscn")
const MARKO_SCENE = preload("res://MarkoFiles/Scenes/markoScene.tscn")

func _ready():
	piano.process_mode = 4
	bass_scene.process_mode = 4
	
func _on_jaw_harp_toggled(toggled_on):
	ihors_scene.visible = toggled_on
	pass # Replace with function body.


func _on_hand_drum_toggled(toggled_on):
	alex_scene.visible = toggled_on
	pass # Replace with function body.
#

func _on_piano_toggled(toggled_on):
	piano.visible = toggled_on
	var process
	if(toggled_on):
		process = 0
	else:
		process = 4
	piano.process_mode = process
	pass # Replace with function body.


func _on_bass_toggled(toggled_on):
	bass_scene.visible = toggled_on
	var process
	if(toggled_on):
		process = 0
	else:
		process = 4
	bass_scene.process_mode = process
	pass # Replace with function body.
