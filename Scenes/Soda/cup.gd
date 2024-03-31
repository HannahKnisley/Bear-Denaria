extends Area2D

var onStation = false
var myStation

var onTray = false

var mouseIn = false
var canHold = true
var followMouse = false

var full = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("mouseClick"):
		if canHold and mouseIn:
			followMouse = true
	if Input.is_action_pressed("mouseClick"):
		if canHold and followMouse:
			self.global_position = get_global_mouse_position()
			
	if Input.is_action_just_released("mouseClick"):
		if followMouse:
			if onTray and full:
				self.reparent(myStation)
				canHold = false
			elif onStation and !full:
				self.reparent(myStation)
				canHold = false
			followMouse = false
	
	
	if self.global_position != self.get_parent().global_position:
		self.translate((self.get_parent().global_position-self.global_position)*10*delta)
		
	


func toppingToMouse():
	var targetoPos = get_global_mouse_position()
	var myPos = self.global_position
	var moveVec = targetoPos-myPos
	return moveVec
	
	
func _on_mouse_entered():
	mouseIn = true


func _on_mouse_exited():
	mouseIn = false


func _on_area_entered(area):
	if area.is_in_group("fillStation"):
		onStation = true
	elif area.is_in_group("burgerTray"):
		onTray = true
	myStation = area


func _on_area_exited(area):
	if area.is_in_group("fillStation"):
		onStation = false
	elif area.is_in_group("burgerTray"):
		onTray = false
