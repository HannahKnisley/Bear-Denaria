extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func giveOrder(ticket):
	$/root/WorldRoot/CanvasLayer/MainUI/screenButtons.visible = false
	$/root/WorldRoot/Camera.global_position = self.global_position + Vector2(500,350)
	var customer = ticket.myCustomer
	$name.text = customer.myName
	
	
