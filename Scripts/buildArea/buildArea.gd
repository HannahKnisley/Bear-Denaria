extends Area2D

var toppingIn = false
@export var theBurg: PackedScene
var myTopping

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("mouseClick") and toppingIn:
		myTopping.reparent($theBurger)



func _on_body_entered(body):
	print(body)
	body.inBuildArea = true
	myTopping = body
	toppingIn = true


func _on_body_exited(body):
	body.inBuildArea = false
	toppingIn = false


func sendBurger():
	$theBurger.reparent(get_node("../traySpawner/burgerTray"))
	var theBurger = theBurg.instantiate()
	self.add_child(theBurger)
	theBurger.global_position = self.global_position+Vector2(0,160)


