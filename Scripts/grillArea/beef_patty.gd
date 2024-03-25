extends RigidBody2D

var mouseEntered = true
var mouseCollide = false
var snapPos
var onGrill = false

var topCook = 0
var bottomCook = 0
var flipping = false
var up = true

var sliding = false

# Called when the node enters the scene tree for the first time.
func _ready():
	snapPos = self.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if flipping:
		flippingAnimate(delta)
		
	elif !flipping and !sliding and !Input.is_action_pressed("mouseClick"):
		if self.global_position != snapPos:
			self.set_collision_mask_value(1, false)
			self.set_collision_mask_value(2, true)
			move_and_collide(burgerToGrill()) 	
		else:
			self.set_collision_mask_value(1, true)
			self.set_collision_mask_value(2, false)
	
func _physics_process(delta):
	if Input.is_action_just_pressed("mouseClick"):
		checkMouse()
		
	if Input.is_action_pressed("mouseClick"):
		if mouseCollide and !flipping and !sliding:
			$cookTimer.stop()
			self.set_collision_mask_value(1, false)
			self.set_collision_mask_value(2, true)
			move_and_collide(burgerToMouse()) 
		
	if Input.is_action_just_released("mouseClick"):
		if !flipping and !sliding:
			move_and_collide((burgerToGrill()))
			self.set_collision_mask_value(1, true)
			self.set_collision_mask_value(2, false)
		if onGrill:
			$cookTimer.start()
		checkMouse()
		
		
	
func burgerToGrill():
	var targetoPos = snapPos
	var myPos = self.global_position
	var moveVec = targetoPos-myPos
	return moveVec
	
func burgerToMouse():
	var targetoPos = get_global_mouse_position()
	var myPos = self.global_position
	var moveVec = targetoPos-myPos
	return moveVec

func snapToGrill(pos):
	snapPos = pos
	onGrill = true
	$cookTimer.start()
	move_and_collide((burgerToGrill()))
	await get_tree().create_timer(0.1).timeout
	
func setSnap(pos):
	snapPos = pos
	move_and_collide((burgerToGrill()))
	await get_tree().create_timer(0.1).timeout

func checkMouse():
	var mousePos = get_global_mouse_position()
	var myPos = self.global_position
	if mousePos.x > myPos.x-60 and mousePos.x<myPos.x+60:
		if mousePos.y > myPos.y-60 and mousePos.y<myPos.y+60:
			mouseCollide = true
	else:
		mouseCollide = false

	
func flippingAnimate(delta):
	if self.global_position > (snapPos-Vector2(0,65)) and up:
		move_and_collide(((snapPos-Vector2(0,70))-self.global_position)*delta*10)
	
	else:
		up = false
		
	if self.global_position < (snapPos-Vector2(0,5)) and !up:
		move_and_collide((snapPos-self.global_position)*delta*10)
	elif !up:
		up = true
		flipping = false
		move_and_collide((burgerToGrill()))
		

func flipBurger():
	flipping = true
	var oldBottom = bottomCook
	bottomCook = topCook
	topCook = oldBottom


func _on_cook_timer_timeout():
	bottomCook += 1
	print(bottomCook)
	
	
func sendToBuild():
	onGrill = false
	$cookTimer.stop()
