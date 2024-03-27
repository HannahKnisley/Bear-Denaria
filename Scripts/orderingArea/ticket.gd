extends Area2D

var takingOrder = true
var mouseIn = false
var holding = false

var onLine = false
var onBig = true

var myArea

var snapPos

# Called when the node enters the scene tree for the first time.
func _ready():
	snapPos = self.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("mouseClick") and mouseIn:
		holding = true
	if Input.is_action_pressed("mouseClick") and holding:
		self.global_position = get_global_mouse_position()
		
	if Input.is_action_just_released("mouseClick") and holding:
		holding = false
		if onLine:
			self.scale = Vector2(1,1)
			snapPos.x = self.global_position.x
			snapPos.y = myArea.global_position.y
		elif onBig:
			self.scale = Vector2(3,3)
			snapPos = myArea.global_position
			
	elif !Input.is_action_pressed("mouseClick"):
		self.translate((snapPos-self.global_position)*delta*10)


func _on_mouse_entered():
	mouseIn = true


func _on_mouse_exited():
	mouseIn = false



func _on_area_entered(area):
	myArea = area
	if area.is_in_group("line"):
		onLine = true
	elif area.is_in_group("bigHold"):
		onBig = true
		


func _on_area_exited(area):
	if area.is_in_group("line"):
		onLine = false
	elif area.is_in_group("bigHold"):
		onBig = false
