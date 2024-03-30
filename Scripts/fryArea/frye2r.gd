extends Area2D

var holdingFries = false
var myFries
var myMeter

# Called when the node enters the scene tree for the first time.
func _ready():
	myMeter = get_node("../cookingMeter2")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_released("mouseClick") and holdingFries:
		myFries.reparent(self)
		myFries.global_position = self.global_position
		$cookTimer.start()
		$oilAnimate.visible = true
		$oilAnimate.play()


func _on_area_entered(area):
	if !holdingFries:
		myFries = area
		holdingFries = true
		
	


func _on_area_exited(area):
	if area == myFries:
		holdingFries = false



func _on_cook_timer_timeout():
	myFries.cook()
	myMeter.doStep()


func _on_child_exiting_tree(node):
	$cookTimer.stop()
	myMeter.reset()
	$oilAnimate.visible = false
