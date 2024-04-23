extends Node2D


func _on_button_pressed():
	$dogbark.play()
	pass # Replace with function body.
	

func _on_h_slider_value_changed(value):
	var pitch:AudioEffectPitchShift = AudioServer.get_bus_effect(0,0)
	
	pitch.pitch_scale = $HSlider.value
	pass # Replace with function body.
	
func _process(_delta):
	if Input.is_action_just_pressed("bark_sound"):
		$dogbark.play()
	if Input.is_action_just_pressed("Cnote"):
		$C1.play()
	if Input.is_action_just_pressed("Dnote"):
		$D.play()
	if Input.is_action_just_pressed("Enote"):
		$E.play()
	if Input.is_action_just_pressed("Fnote"):
		$F.play()
	if Input.is_action_just_pressed("Gnote"):
		$G.play()
	if Input.is_action_just_pressed("Anote"):
		$A.play()
	if Input.is_action_just_pressed("Bnote"):
		$B.play()


func _on_c_1_button_down():
	$C1.play()
	pass # Replace with function body.

func _on_d_button_button_down():
	$D.play()
	pass # Replace with function body.

func _on_e_button_button_down():
	$E.play()
	pass # Replace with function body.

func _on_f_button_button_down():
	$F.play()
	pass # Replace with function body.
	
	
	
func _on_c_2_butt_button_down():
	$C2.play()
	pass # Replace with function body
