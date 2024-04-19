extends Panel

@export var buttons = []
@onready var c = $C
@onready var d = $D
@onready var e = $E
@onready var f = $F
@onready var g = $G
@onready var a = $A
@onready var b = $B

func _ready():
	buttons.append(c)
	buttons.append(d)
	buttons.append(e)
	buttons.append(f)
	buttons.append(g)
	buttons.append(a)
	buttons.append(b)

