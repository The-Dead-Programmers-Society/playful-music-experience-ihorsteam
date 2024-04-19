extends Node2D

@onready var bass_test = $Bass_Test

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("Play_Bass"):
		bass_test.play()
