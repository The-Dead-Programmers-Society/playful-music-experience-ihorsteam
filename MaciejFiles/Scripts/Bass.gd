extends Node2D

@onready var bass_test = $Bass_Test
@onready var E = $E
@onready var F = $F
@onready var Fsharp = $Fsharp
@onready var G = $G
@onready var Gsharp = $Gsharp
@onready var A = $A
@onready var Asharp = $Asharp
@onready var B = $B
@onready var C = $C
@onready var Csharp = $Csharp
@onready var D = $D
@onready var Dsharp = $Dsharp
@onready var E2 = $E2
@onready var F2= $F2
@onready var Fsharp2= $Fsharp2
@onready var G2 = $G2
@onready var Gsharp2= $Gsharp2
@onready var A2 = $A2
@onready var Asharp2= $Asharp2
@onready var B2= $B2
@onready var C2= $C2
@onready var Csharp2= $Csharp2
@onready var D2 = $D2


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
	elif Input.is_action_just_released("E"):
		E.visible = false

func play_F():
	if Input.is_action_just_pressed("F"):
		F.visible = true
	elif Input.is_action_just_released("F"):
		F.visible = false

func play_Fsharp():
	if Input.is_action_just_pressed("Fsharp"):
		Fsharp.visible = true
	elif Input.is_action_just_released("Fsharp"):
		Fsharp.visible = false

func play_G():
	if Input.is_action_just_pressed("G"):
		G.visible = true
	elif Input.is_action_just_released("G"):
		G.visible = false

func play_Gsharp():
	if Input.is_action_just_pressed("Gsharp"):
		Gsharp.visible = true
	elif Input.is_action_just_released("Gsharp"):
		Gsharp.visible = false

func play_A():
	if Input.is_action_just_pressed("A"):
		A.visible = true
	elif Input.is_action_just_released("A"):
		A.visible = false

func play_Asharp():
	if Input.is_action_just_pressed("Asharp"):
		Asharp.visible = true
	elif Input.is_action_just_released("Asharp"):
		Asharp.visible = false

func play_B():
	if Input.is_action_just_pressed("B"):
		B.visible = true
	elif Input.is_action_just_released("B"):
		B.visible = false

func play_C():
	if Input.is_action_just_pressed("C"):
		C.visible = true
	elif Input.is_action_just_released("C"):
		C.visible = false

func play_Csharp():
	if Input.is_action_just_pressed("Csharp"):
		Csharp.visible = true
	elif Input.is_action_just_released("Csharp"):
		Csharp.visible = false

func play_D():
	if Input.is_action_just_pressed("D"):
		D.visible = true
	elif Input.is_action_just_released("D"):
		D.visible = false

func play_Dsharp():
	if Input.is_action_just_pressed("Dsharp"):
		Dsharp.visible = true
	elif Input.is_action_just_released("Dsharp"):
		Dsharp.visible = false

func play_E2():
	if Input.is_action_just_pressed("E2"):
		E2.visible = true
	elif Input.is_action_just_released("E2"):
		E2.visible = false
