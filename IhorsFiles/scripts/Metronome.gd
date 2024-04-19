extends Control

@onready var bpm:float  = 60:
	get:
		return bpm
	set(value):
		bps = 60/value
		bpm = value
		
@onready var bps:float  = 60/bpm
var time:float  = 0.0
@onready var main_sound = $"../MainSound"
@export var array2D = []
var current_row = 0
@onready var panel_3 = $"../Panel3"
@onready var panel_4 = $"../Panel4"

var repeat:bool  = false

func _ready():
	array2D.append(panel_3.buttons)
	array2D.append(panel_4.buttons)
func _process(delta):
	if(repeat):
		time +=delta
	
		if time >= bps:
			
			time -=bps
			for i in array2D[current_row]:
				if(i.can_play):
					i.audio.play()
			current_row +=1
		if(current_row > array2D.size() - 1):
			current_row = 0




func _on_toggled(toggled_on):
	repeat = toggled_on
	pass # Replace with function body.


func _on_v_slider_value_changed(value):
	bpm = value
	pass # Replace with function body.
