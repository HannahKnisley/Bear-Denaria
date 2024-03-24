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
			print("meowmeow")
			heldPatty.snapToGrill(self.global_position)
			canHoldPatty = false
		
		





func _on_body_entered(body):
	if body.is_in_group("patty") and canHoldPatty:
		print("enter")
		heldPatty = body
		collidingPatty = true
		

			
		

func _on_body_exited(body):
	if body == heldPatty:
		print("exit")
		canHoldPatty = true
		collidingPatty = false
		
