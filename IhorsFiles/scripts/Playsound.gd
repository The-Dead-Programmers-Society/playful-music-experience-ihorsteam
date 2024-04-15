extends Button

@onready var main_sound = $MainSound

func _on_pressed():
	main_sound.play()
	pass # Replace with function body.
