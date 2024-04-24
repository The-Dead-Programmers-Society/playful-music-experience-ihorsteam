extends Node2D

@onready var E = $Notes/E
@onready var E_note = $Notes/E/AudioStreamPlayer2D

@onready var F = $Notes/F
@onready var F_note = $Notes/F/AudioStreamPlayer2D

@onready var Fsharp = $Notes/Fsharp
@onready var Fsharp_note = $Notes/Fsharp/AudioStreamPlayer2D

@onready var G = $Notes/G
@onready var G_note = $Notes/G/AudioStreamPlayer2D

@onready var Gsharp = $Notes/Gsharp
@onready var Gsharp_note = $Notes/Gsharp/AudioStreamPlayer2D

@onready var A = $Notes/A
@onready var A_note = $Notes/A/AudioStreamPlayer2D

@onready var Asharp = $Notes/Asharp
@onready var Asharp_note = $Notes/Asharp/AudioStreamPlayer2D

@onready var B = $Notes/B
@onready var B_note = $Notes/B/AudioStreamPlayer2D

@onready var C = $Notes/C
@onready var C_note = $Notes/C/AudioStreamPlayer2D

@onready var Csharp = $Notes/Csharp
@onready var Csharp_note = $Notes/Csharp/AudioStreamPlayer2D

@onready var D = $Notes/D
@onready var D_note = $Notes/D/AudioStreamPlayer2D

@onready var Dsharp = $Notes/Dsharp
@onready var Dsharp_note = $Notes/Dsharp/AudioStreamPlayer2D

@onready var E2 = $Notes/E2
@onready var E2_note = $Notes/E2/AudioStreamPlayer2D

@onready var F2= $Notes/F2
@onready var Fsharp2= $Notes/Fsharp2
@onready var G2 = $Notes/G2
@onready var Gsharp2= $Notes/Gsharp2
@onready var A2 = $Notes/A2
@onready var Asharp2= $Notes/Asharp2
@onready var B2= $Notes/B2
@onready var C2= $Notes/C2
@onready var Csharp2= $Notes/Csharp2
@onready var D2 = $Notes/D2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	play_E()
	play_F()
	play_Fsharp()
	play_G()
	play_Gsharp()
	play_A()
	play_Asharp()
	play_B()
	play_C()
	play_Csharp()
	play_D()
	play_Dsharp()
	play_E2()

func play_E():
	if Input.is_action_just_pressed("E"):
		E.visible = true
		E_note.playing = true
	elif Input.is_action_just_released("E"):
		E.visible = false
		E_note.playing = false

func play_F():
	if Input.is_action_just_pressed("F"):
		F.visible = true
		F_note.playing = true
	elif Input.is_action_just_released("F"):
		F.visible = false
		F_note.playing = false

func play_Fsharp():
	if Input.is_action_just_pressed("Fsharp"):
		Fsharp.visible = true
		Fsharp_note.playing = true
	elif Input.is_action_just_released("Fsharp"):
		Fsharp.visible = false
		Fsharp_note.playing = false

func play_G():
	if Input.is_action_just_pressed("G"):
		G.visible = true
		G_note.playing = true
	elif Input.is_action_just_released("G"):
		G.visible = false
		G_note.playing = false

func play_Gsharp():
	if Input.is_action_just_pressed("Gsharp"):
		Gsharp.visible = true
		Gsharp_note.playing = true
	elif Input.is_action_just_released("Gsharp"):
		Gsharp.visible = false
		Gsharp_note.playing = false

func play_A():
	if Input.is_action_just_pressed("A"):
		A.visible = true
		A_note.playing = true
	elif Input.is_action_just_released("A"):
		A.visible = false
		A_note.playing = false

func play_Asharp():
	if Input.is_action_just_pressed("Asharp"):
		Asharp.visible = true
		Asharp_note.playing = true
	elif Input.is_action_just_released("Asharp"):
		Asharp.visible = false
		Asharp_note.playing = false

func play_B():
	if Input.is_action_just_pressed("B"):
		B.visible = true
		B_note.playing = true
	elif Input.is_action_just_released("B"):
		B.visible = false
		B_note.playing = false

func play_C():
	if Input.is_action_just_pressed("C"):
		C.visible = true
		C_note.playing = true
	elif Input.is_action_just_released("C"):
		C.visible = false
		C_note.playing = false

func play_Csharp():
	if Input.is_action_just_pressed("Csharp"):
		Csharp.visible = true
		Csharp_note.playing = true
	elif Input.is_action_just_released("Csharp"):
		Csharp.visible = false
		Csharp_note.playing = false

func play_D():
	if Input.is_action_just_pressed("D"):
		D.visible = true
		D_note.playing = true
	elif Input.is_action_just_released("D"):
		D.visible = false
		D_note.playing = false

func play_Dsharp():
	if Input.is_action_just_pressed("Dsharp"):
		Dsharp.visible = true
		Dsharp_note.playing = true
	elif Input.is_action_just_released("Dsharp"):
		Dsharp.visible = false
		Dsharp_note.playing = false

func play_E2():
	if Input.is_action_just_pressed("E2"):
		E2.visible = true
		E2_note.playing = true
	elif Input.is_action_just_released("E2"):
		E2.visible = false
		E2_note.playing = false
