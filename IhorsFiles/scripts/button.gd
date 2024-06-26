extends Button
class_name AudioButton

var can_play:bool = false
@export_range(0,12) var current_note:int = 0 
@onready var audio = $AudioStreamPlayer2D
@onready var panel_3 = $".."
var current_theme
@onready var note = $Note


func _ready():
	pitch_sound(current_note)
	current_theme = panel_3.get_theme_stylebox("panel")
	
func pitch_sound(note: float):
	var pitch = pow(2, note/12.0)
	audio.pitch_scale = pitch

func play():
	note.restart()
	audio.play()
	await get_tree().create_timer(0.2).timeout
	note.emitting = false
func _on_toggled(toggled_on):
	can_play = toggled_on
	pass # Replace with function body.
func toggleOff():
	button_pressed = false
func panel_turnOn():
	var style:StyleBoxFlat = StyleBoxFlat.new()
	style.bg_color =  Color.BLACK
	style.bg_color.a = 1
	panel_3.add_theme_stylebox_override ("panel", style)
func panel_turnOff():
	await get_tree().create_timer(0.2).timeout
	panel_3.add_theme_stylebox_override ("panel", current_theme)
