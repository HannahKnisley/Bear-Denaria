extends Area2D

var toppingIn = false
var myTopping

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("mouseClick") and toppingIn:
		self.add_child(myTopping)
		print(self.get_children())



func _on_body_entered(body):
	print(body)
	body.inBuildArea = true
	myTopping = body
	toppingIn = true


func _on_body_exited(body):
	body.inBuildArea = false
	toppingIn = false


func sendBurger():
	print("send")
