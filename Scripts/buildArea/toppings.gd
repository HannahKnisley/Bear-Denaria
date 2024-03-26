extends RigidBody2D

var mouseCollide = false
var snapPos

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
		if mouseCollide:
			move_and_collide(toppingToMouse()) 
		
	if Input.is_action_just_released("mouseClick"):
		move_and_collide(toppingToSnap())
		
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

func checkMouse():
	var mousePos = get_global_mouse_position()
	var myPos = self.global_position
	if mousePos.x > myPos.x-60 and mousePos.x<myPos.x+60:
		if mousePos.y > myPos.y-60 and mousePos.y<myPos.y+60:
			mouseCollide = true
	else:
		mouseCollide = false


func _on_body_entered(body):
	if body.is_in_group("buildArea"):
		print("yes")
