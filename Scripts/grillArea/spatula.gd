extends Area2D

var onPatty = false
var myPatty 
var defaultPosition
var snapPos
var flipping = false
var up = true

var followMouse = false

var mouseIn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	defaultPosition = self.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("mouseClick") and mouseIn:
		followMouse = true
	if Input.is_action_pressed("mouseClick") and followMouse:
		self.global_position = get_global_mouse_position()
	if Input.is_action_just_released("mouseClick"):
		if onPatty:
			self.global_position = myPatty.global_position
			snapPos = self.global_position
			flipping = true
			myPatty.flipBurger()
		followMouse = false
			
	# WE ARE CLOSED FOR EBOLA >:(
	if flipping:
		self.reparent(get_node("../../spatulaBelow"))
		if self.global_position > (snapPos-Vector2(0,65)) and up:
			self.translate(((snapPos-Vector2(0,70))-self.global_position)*delta*10)
		else:
			up = false
			self.reparent(get_node("../../spatulaAbove"))
			
		if self.global_position < (snapPos-Vector2(0,5)) and !up:
			self.translate((snapPos-self.global_position)*delta*10)
		elif !up:
			up = true
			flipping = false
			

	elif !Input.is_action_pressed("mouseClick"):
		self.translate((defaultPosition-self.global_position)*delta*10)
func _on_body_entered(body):
	if body.is_in_group("patty") and body.onGrill:
		onPatty = true
		myPatty = body


func _on_body_exited(body):
	onPatty = false


func _on_mouse_entered():
	mouseIn = true


func _on_mouse_exited():
	mouseIn = false
