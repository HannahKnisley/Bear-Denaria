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
		else:
			followMouse = false
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
		cookLevel += 1
		if cookLevel > 25:
			$fry1.visible = false
			$fry2.visible = true
		if cookLevel > 45:
			$fry2.visible = false
			$fry3.visible = true
		if cookLevel >70:
			$fry3.visible = false
			$fry4.visible = true
		if cookLevel == 90:
			$fry4.visible = false
			$fry5.visible = true


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
