extends Node2D

@export var topBun: PackedScene
@export var bottomBun: PackedScene

var buttonPressed = true
var newTopping

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if self.get_child_count() == 0 and self.get_parent().visible == true and Globals.budget > 0:
		spawn_item()
	if self.get_parent().visible == false or Globals.budget==0:
		buttonPressed = true
		for child in self.get_children():
			child.queue_free()

func spawn_item():
	if Globals.lastBun == "bottom":
		newTopping = topBun.instantiate()
		Globals.lastBun = "top"
	elif Globals.lastBun == "top":
		newTopping = bottomBun.instantiate()
		Globals.lastBun = "bottom"
	self.add_child(newTopping)
	newTopping.global_position = self.global_position
	
	if buttonPressed == false:
		Globals.budget -= 1
	else:
		buttonPressed = false


