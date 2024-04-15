extends Panel
@onready var main_sound = $"../Play/MainSound"

func pitch_sound(note: float):
	var pitch = pow(2, note/12.0)
	main_sound.pitch_scale = pitch
	main_sound.play()

func _on_c_pressed():
	pitch_sound(0)
	pass # Replace with function body.


func _on_d_pressed():
	pitch_sound(2)
	pass # Replace with function body.


func _on_e_pressed():
	pitch_sound(4)
	pass # Replace with function body.


func _on_f_pressed():
	pitch_sound(6)
	pass # Replace with function body.


func _on_g_pressed():
	pitch_sound(8)
	pass # Replace with function body.


func _on_b_pressed():
	pitch_sound(10)
	pass # Replace with function body.


func _on_a_pressed():
	pitch_sound(12)
	pass # Replace with function body.
