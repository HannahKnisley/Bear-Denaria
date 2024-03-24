extends RigidBody2D

var mouseEntered = true
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
			self.set_collision_mask_value(1, false)
			self.set_collision_mask_value(2, true)
			move_and_collide(burgerToMouse())
		
	if Input.is_action_just_released("mouseClick"):
		move_and_collide((burgerToGrill()))
		await get_tree().create_timer(0.05).timeout
		self.set_collision_mask_value(1, true)
		self.set_collision_mask_value(2, false)
		
			

func burgerToGrill():
	var targetoPos = snapPos
	var myPos = self.global_position
	var moveVec = targetoPos-myPos
	return moveVec
	

func burgerToMouse():
	var targetoPos = get_viewport().get_mouse_position()
	var myPos = self.global_position
	var moveVec = targetoPos-myPos
	return moveVec

func snapToGrill(pos):
	snapPos = pos
	
func checkMouse():
	var mousePos = get_viewport().get_mouse_position()
	if mousePos.x > self.global_position.x-60 and mousePos.x<self.global_position.x+60:
		if mousePos.y > self.global_position.y-60 and mousePos.y<self.global_position.x+60:
			mouseCollide = true
	else:
		mouseCollide = false



