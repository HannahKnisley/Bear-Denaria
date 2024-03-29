extends Area2D

var mouseIn = false
var canHold = true
var followMouse = false

var cookLevel = 0

var onTray = false
var myTray

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
			self.translate(toppingToMouse())
			
	if Input.is_action_just_released("mouseClick"):
		if followMouse:
			if onTray:
				self.reparent(myTray)
				canHold = false
			followMouse = false
			
	if !followMouse and canHold:
		self.translate(toppingToSnap())

func cook():
	if cookLevel != 100:
		cookLevel += 2

func toppingToMouse():
	var targetoPos = get_global_mouse_position()
	var myPos = self.global_position
	var moveVec = targetoPos-myPos
	return moveVec
	
func toppingToSnap():
	var targetPos = self.get_parent().global_position
	var myPos = self.global_position
	var moveVec = targetPos-myPos
	return moveVec
	

func _on_mouse_entered():
	mouseIn = true


func _on_mouse_exited():
	mouseIn = false


func _on_area_entered(area):
	if area.is_in_group("burgerTray"):
		onTray = true
		myTray = area


func _on_area_exited(area):
	if area.is_in_group("burgerTray"):
		onTray = false
