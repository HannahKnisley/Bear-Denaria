extends Area2D


var canHoldPatty = true
var collidingPatty = false
var heldPatty = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("mouseClick"):
		if canHoldPatty and collidingPatty:
			heldPatty.snapToGrill(self.global_position)
			heldPatty.reparent(self)
			canHoldPatty = false
		
	elif !Input.is_action_just_released("mouseClick") and !Input.is_action_pressed("mouseClick"):
		if collidingPatty:
			canHoldPatty = false





func _on_body_entered(body):
	if body.is_in_group("patty") and canHoldPatty:
		heldPatty = body
		collidingPatty = true
		

			
		

func _on_body_exited(body):
	if body == heldPatty:
		canHoldPatty = true
		collidingPatty = false
		
