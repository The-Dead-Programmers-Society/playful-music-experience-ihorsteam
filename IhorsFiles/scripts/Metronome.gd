extends Control

@onready var bpm:float  = 100:
	get:
		return bpm
	set(value):
		bps = 60/value
		bpm = value
		
@onready var bps:float  = 60/bpm
var time:float  = 0.0
@export var array2D = []
var current_row = 0
@onready var panel_3 = $"../../Pads/Panel3"
@onready var panel_4 = $"../../Pads/Panel4"
@onready var panel_5 = $"../../Pads/Panel5"
@onready var panel_6 = $"../../Pads/Panel6"
@onready var panel_7 = $"../../Pads/Panel7"
@onready var panel_8 = $"../../Pads/Panel8"
@onready var panel_9 = $"../../Pads/Panel9"

var repeat:bool  = false

func _ready():
	array2D.append(panel_3.buttons)
	array2D.append(panel_4.buttons)
	array2D.append(panel_5.buttons)
	array2D.append(panel_6.buttons)
	array2D.append(panel_7.buttons)
	array2D.append(panel_8.buttons)
	array2D.append(panel_9.buttons)
func _process(delta):
	if(repeat):
		time +=delta
	
		if time >= bps:
			
			time -=bps
			array2D[current_row][0].panel_turnOn()
			for i in array2D[current_row]:
				if(i.can_play):
					i.play()
			array2D[current_row][0].panel_turnOff()
			current_row +=1
		if(current_row > array2D.size() - 1):
			current_row = 0
			




func _on_toggled(toggled_on):
	repeat = toggled_on
	current_row = 0
	pass # Replace with function body.

func _on_clear_pressed():
	for i in array2D.size():
		for j in array2D[i].size():
			array2D[i][j].toggleOff()
	pass # Replace with function body.





func _on_h_slider_value_changed(value):
	bpm = value
	pass # Replace with function body.
