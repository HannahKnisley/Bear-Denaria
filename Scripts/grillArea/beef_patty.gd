extends RigidBody2D

var mouseEntered = true
var mouseCollide = false
var snapPos
var onGrill = false

var topCook = 0
var bottomCook = 0
var flipping = false
var up = true

# Called when the node enters the scene tree for the first time.
func _ready():
	snapPos = self.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if flipping:
		flippingAnimate(delta)
	
func _physics_process(delta):
	if Input.is_action_just_pressed("mouseClick"):
		checkMouse()
		
	if Input.is_action_pressed("mouseClick"):
		if mouseCollide and !flipping:
			$cookTimer.stop()
			self.set_collision_mask_value(1, false)
			self.set_collision_mask_value(2, true)
			move_and_collide(burgerToMouse()) 
		
	if Input.is_action_just_released("mouseClick"):
		if !flipping:
			move_and_collide((burgerToGrill()))
			await get_tree().create_timer(0.3).timeout
			self.set_collision_mask_value(1, true)
			self.set_collision_mask_value(2, false)
		if onGrill:
			$cookTimer.start()
		
		
	
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
	onGrill = true
	$cookTimer.start()

func checkMouse():
	var mousePos = get_viewport().get_mouse_position()
	if mousePos.x > self.global_position.x-60 and mousePos.x<self.global_position.x+60:
		if mousePos.y > self.global_position.y-60 and mousePos.y<self.global_position.x+60:
			mouseCollide = true
	else:
		mouseCollide = false

	
func flippingAnimate(delta):
	self.set_collision_mask_value(1, false)
	self.set_collision_mask_value(2, true)
	if self.global_position > (snapPos-Vector2(0,85)) and up:
		move_and_collide(((snapPos-Vector2(0,90))-self.global_position)*delta*10)
	
	else:
		up = false
		
	if self.global_position < (snapPos-Vector2(0,5)) and !up:
		move_and_collide((snapPos-self.global_position)*delta*10)
	elif !up:
		self.set_collision_mask_value(1, true)
		self.set_collision_mask_value(2, false)
		up = true
		flipping = false
		

func flipBurger():
	flipping = true
	var oldBottom = bottomCook
	bottomCook = topCook
	topCook = oldBottom


func _on_cook_timer_timeout():
	bottomCook += 1
	print(bottomCook)
	
	
func sendToBuild():
	$cookTimer.start()
	self.translate(Vector2(0,100))
