extends RigidBody2D

var mouseCollide = false
var snapPos
var canGrab = true
var inBuildArea = false

# Called when the node enters the scene tree for the first time.
func _ready():
	snapPos = self.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _physics_process(delta):
	if Input.is_action_just_pressed("mouseClick"):
		checkMouse()
		
	if Input.is_action_pressed("mouseClick"):
		if mouseCollide and canGrab:
			move_and_collide(toppingToMouse())
		
	if Input.is_action_just_released("mouseClick"):
		if inBuildArea and canGrab:
			setSnap(self.global_position)
			self.freeze = false
		elif canGrab:
			move_and_collide(toppingToSnap())
			
	if self.freeze == false:
		var first = self.global_position
		await get_tree().create_timer(0.5).timeout
		if self.global_position == first:
			self.freeze = true
			get_node("../../../builtBurger").sendBurger()
	
	
		
func toppingToMouse():
	var targetoPos = get_global_mouse_position()
	var myPos = self.global_position
	var moveVec = targetoPos-myPos
	return moveVec
	
func toppingToSnap():
	var targetoPos = snapPos
	var myPos = self.global_position
	var moveVec = targetoPos-myPos
	return moveVec
	
func setSnap(pos):
	snapPos = pos
	move_and_collide(toppingToSnap())
	canGrab = false
	

func checkMouse():
	var mousePos = get_global_mouse_position()
	var myPos = self.global_position
	if mousePos.x > myPos.x-60 and mousePos.x<myPos.x+60:
		if mousePos.y > myPos.y-60 and mousePos.y<myPos.y+60:
			mouseCollide = true
		else:
			mouseCollide = false
	else:
		mouseCollide = false

